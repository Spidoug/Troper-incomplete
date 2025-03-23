void Adicionar() {

  if (equipamentolista < 6) {
    equipamentolista = equipamentolista + 1;
    cp1.getController("Ma" + equipamentolista).show();
    cp1.getController("Cl" + equipamentolista).show();
    cp1.getController("Eq" + equipamentolista).show();
    cp1.getController("Mo" + equipamentolista).show();
    cp1.getController("Sn" + equipamentolista).show();
    cp1.getController("Ve" + equipamentolista).show();
  }
}

void Remover() {
  if (equipamentolista > 1) {
    cp1.getController("Ma" + equipamentolista).hide();
    cp1.getController("Cl" + equipamentolista).hide();
    cp1.getController("Eq" + equipamentolista).hide();
    cp1.getController("Mo" + equipamentolista).hide();
    cp1.getController("Sn" + equipamentolista).hide();
    cp1.getController("Ve" + equipamentolista).hide();
    equipamentolista = equipamentolista - 1;
  }
}

void Incluir() {

  switch(activeTab) {

  case 1:

    if (horaslista < 5) {
      horaslista = horaslista + 1;
      cp1.getController("Data" + horaslista).show();
      cp1.getController("DeslT" + horaslista).show();
      cp1.getController("DeslA" + horaslista).show();
      cp1.getController("HorT" + horaslista).show();
      cp1.getController("Diver" + horaslista).show();
      cp1.getController("Total" + horaslista).show();
    }
    break;


  case 2:

    if (pecaslista < 5) {
      pecaslista = pecaslista + 1;
      cp1.getController("Pedido" + pecaslista).show();
      cp1.getController("ContrPc" + pecaslista).show();
      cp1.getController("Item" + pecaslista).show();
      cp1.getController("Descr" + pecaslista).show();
      cp1.getController("Quantid" + pecaslista).show();
      cp1.getController("Detalhe" + pecaslista).show();
    }
    break;
  }
}


void Retirar() {

  switch(activeTab) {

  case 1:

    if (horaslista > 1) {
      cp1.getController("Data" + horaslista).hide();
      cp1.getController("DeslT" + horaslista).hide();
      cp1.getController("DeslA" + horaslista).hide();
      cp1.getController("HorT" + horaslista).hide();
      cp1.getController("Diver" + horaslista).hide();
      cp1.getController("Total" + horaslista).hide();
      horaslista = horaslista - 1;
    }
    break;


  case 2:

    if (pecaslista > 1) {
      cp1.getController("Pedido" + pecaslista).hide();
      cp1.getController("ContrPc" + pecaslista).hide();
      cp1.getController("Item" + pecaslista).hide();
      cp1.getController("Descr" + pecaslista).hide();
      cp1.getController("Quantid" + pecaslista).hide();
      cp1.getController("Detalhe" + pecaslista).hide();
      pecaslista = pecaslista - 1;
    }
    break;
  }
}

void Novo() {
  jsonnew();
  jsonex();
}

void Abrir() {
  selectInput("Selecione um arquivo:", "fileSelectedjson");
  jsonex();
}

void Arquivar() {
  jsonset();
  selectOutput("Escolha onde salvar o arquivo:", "fileSavejson");
}

void Assinar() {
  saveData();

  // Cria a janela secundária
  winass = new PWindowAss(primaryX, primaryY);
}

void Copiar() {
  jsonset();
  copiadados = new JSONObject();
  copiadados = dados;
}

void Colar() {
  dados = copiadados;
  jsonex();
}

void PDF() {
  createPDFWindow();
}

void keyPressed() {

  if (key == ESC) {
    key = 0;
  }

  if (key == CODED) {
    if (keyCode == CONTROL) {
      relat.setText("");
      relat.moveCaretTo(0, 0); // also doesn't work
      //      textArea.setFont(new Font("someOtherFont", Font.PLAIN, 40));
      // if caret is not placed to the beginning manually, app will crash
    }
  }
}
