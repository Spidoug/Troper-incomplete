void fileSelectedjson(File selection) {
  if (selection == null) {
    println("Nenhum arquivo foi selecionado.");
  } else {
    println("Arquivo selecionado: " + selection.getAbsolutePath());
    
    try {
      
      String[] decryptedJsonLines = decryptFile(selection.getAbsolutePath(), secretKey);
      String decryptedJson = String.join("\n", decryptedJsonLines);
      
      
      dados = parseJSONObject(decryptedJson);
      
      println("Conteúdo do JSON:");
      println(dados.toString());
      
      jsonex();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

void fileSavejson(File selection) {
  if (selection == null) {
    println("Nenhum local de salvamento foi selecionado.");
  } else {
    println("Arquivo será salvo em: " + selection.getAbsolutePath());
    
    try {
      
      String jsonString = dados.toString();
      
      String encryptedJson = encryptText(jsonString, secretKey);
      
      saveStrings(selection.getAbsolutePath(), new String[]{encryptedJson});
      
      println("Arquivo criptografado salvo com sucesso.");
      
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

String[] decryptFile(String pointer, String keys) throws Exception {
  String encryptedTextBase64 = loadStrings(pointer)[0];
  byte[] encryptedText = Base64.getDecoder().decode(encryptedTextBase64);

  SecretKeySpec secretKeySpec = new SecretKeySpec(keys.getBytes(), "AES");
  Cipher cipher = Cipher.getInstance("AES");
  cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);

  byte[] decryptedText = cipher.doFinal(encryptedText);
  return new String(decryptedText).split("\n");
}

String encryptText(String text, String keys) throws Exception {
  SecretKeySpec secretKeySpec = new SecretKeySpec(keys.getBytes(), "AES");
  Cipher cipher = Cipher.getInstance("AES");
  cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);

  byte[] encryptedText = cipher.doFinal(text.getBytes());
  return Base64.getEncoder().encodeToString(encryptedText);
}
