void setupDatabase() {
  String databaseFilePath = "jdbc:sqlite:" + dataPath("troper.db");

  try {
    conn = DriverManager.getConnection(databaseFilePath);
    stmt = conn.createStatement();
    System.out.println("Conectado ao banco de dados com sucesso.");

    String createTableQuery = "CREATE TABLE IF NOT EXISTS dados_gui (" +
      "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "endereco TEXT, campus TEXT, bloco TEXT, sala TEXT, bairro TEXT, " +
      "cidade TEXT, cep TEXT, telefone TEXT, ramal TEXT, email TEXT, idt TEXT, " +
      "chamado TEXT, contrato TEXT, contato TEXT, responsavel TEXT, " +
      "ma1 TEXT, cl1 TEXT, eq1 TEXT, mo1 TEXT, sn1 TEXT, ve1 TEXT, " +
      "ma2 TEXT, cl2 TEXT, eq2 TEXT, mo2 TEXT, sn2 TEXT, ve2 TEXT, " +
      "ma3 TEXT, cl3 TEXT, eq3 TEXT, mo3 TEXT, sn3 TEXT, ve3 TEXT, " +
      "ma4 TEXT, cl4 TEXT, eq4 TEXT, mo4 TEXT, sn4 TEXT, ve4 TEXT, " +
      "ma5 TEXT, cl5 TEXT, eq5 TEXT, mo5 TEXT, sn5 TEXT, ve5 TEXT, " +
      "ma6 TEXT, cl6 TEXT, eq6 TEXT, mo6 TEXT, sn6 TEXT, ve6 TEXT, " +
      "data1 TEXT, deslt1 TEXT, desla1 TEXT, hort1 TEXT, diver1 TEXT, total1 TEXT, " +
      "data2 TEXT, deslt2 TEXT, desla2 TEXT, hort2 TEXT, diver2 TEXT, total2 TEXT, " +
      "data3 TEXT, deslt3 TEXT, desla3 TEXT, hort3 TEXT, diver3 TEXT, total3 TEXT, " +
      "data4 TEXT, deslt4 TEXT, desla4 TEXT, hort4 TEXT, diver4 TEXT, total4 TEXT, " +
      "data5 TEXT, deslt5 TEXT, desla5 TEXT, hort5 TEXT, diver5 TEXT, total5 TEXT, " +
      "pedido1 TEXT, contrpc1 TEXT, item1 TEXT, descr1 TEXT, quantid1 TEXT, detalhe1 TEXT, " +
      "pedido2 TEXT, contrpc2 TEXT, item2 TEXT, descr2 TEXT, quantid2 TEXT, detalhe2 TEXT, " +
      "pedido3 TEXT, contrpc3 TEXT, item3 TEXT, descr3 TEXT, quantid3 TEXT, detalhe3 TEXT, " +
      "pedido4 TEXT, contrpc4 TEXT, item4 TEXT, descr4 TEXT, quantid4 TEXT, detalhe4 TEXT, " +
      "pedido5 TEXT, contrpc5 TEXT, item5 TEXT, descr5 TEXT, quantid5 TEXT, detalhe5 TEXT" +
      ")";

    stmt.execute(createTableQuery);
    System.out.println("Tabela criada ou já existente.");
  } catch (SQLException e) {
    System.out.println("Erro ao conectar: " + e.getMessage());
  } finally {
    closeConnection();
  }
}

void saveData() {
  String insertQuery = "INSERT INTO dados_gui (" +
    "endereco, campus, bloco, sala, bairro, cidade, cep, telefone, ramal, email, " +
    "idt, chamado, contrato, contato, responsavel, " +
    "ma1, cl1, eq1, mo1, sn1, ve1, ma2, cl2, eq2, mo2, sn2, ve2, ma3, cl3, eq3, mo3, sn3, ve3, " +
    "ma4, cl4, eq4, mo4, sn4, ve4, ma5, cl5, eq5, mo5, sn5, ve5, ma6, cl6, eq6, mo6, sn6, ve6, " +
    "data1, deslt1, desla1, hort1, diver1, total1, data2, deslt2, desla2, hort2, diver2, total2, " +
    "data3, deslt3, desla3, hort3, diver3, total3, data4, deslt4, desla4, hort4, diver4, total4, " +
    "data5, deslt5, desla5, hort5, diver5, total5, " +
    "pedido1, contrpc1, item1, descr1, quantid1, detalhe1, " +
    "pedido2, contrpc2, item2, descr2, quantid2, detalhe2, " +
    "pedido3, contrpc3, item3, descr3, quantid3, detalhe3, " +
    "pedido4, contrpc4, item4, descr4, quantid4, detalhe4, " +
    "pedido5, contrpc5, item5, descr5, quantid5, detalhe5" +
    ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

  try {
    conn = DriverManager.getConnection("jdbc:sqlite:" + dataPath("troper.db"));
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);
    pstmt.setString(1, cp1.get(Textfield.class, "Endereco").getText());
    pstmt.setString(2, cp1.get(Textfield.class, "Campus").getText());
    pstmt.setString(3, cp1.get(Textfield.class, "Bloco").getText());
    pstmt.setString(4, cp1.get(Textfield.class, "Sala").getText());
    pstmt.setString(5, cp1.get(Textfield.class, "BairroDistrito").getText());
    pstmt.setString(6, cp1.get(Textfield.class, "Cidade").getText());
    pstmt.setString(7, cp1.get(Textfield.class, "CEP").getText());
    pstmt.setString(8, cp1.get(Textfield.class, "Telefone").getText());
    pstmt.setString(9, cp1.get(Textfield.class, "Ramal").getText());
    pstmt.setString(10, cp1.get(Textfield.class, "Email").getText());
    pstmt.setString(11, cp1.get(Textfield.class, "ID").getText());
    pstmt.setString(12, cp1.get(Textfield.class, "Chamado").getText());
    pstmt.setString(13, cp1.get(Textfield.class, "Contrato").getText());
    pstmt.setString(14, cp1.get(Textfield.class, "Contato").getText());
    pstmt.setString(15, cp1.get(Textfield.class, "Responsavel").getText());
    pstmt.setString(16, cp1.get(Textfield.class, "Ma1").getText());
    pstmt.setString(17, cp1.get(Textfield.class, "Cl1").getText());
    pstmt.setString(18, cp1.get(Textfield.class, "Eq1").getText());
    pstmt.setString(19, cp1.get(Textfield.class, "Mo1").getText());
    pstmt.setString(20, cp1.get(Textfield.class, "Sn1").getText());
    pstmt.setString(21, cp1.get(Textfield.class, "Ve1").getText());
    pstmt.setString(22, cp1.get(Textfield.class, "Ma2").getText());
    pstmt.setString(23, cp1.get(Textfield.class, "Cl2").getText());
    pstmt.setString(24, cp1.get(Textfield.class, "Eq2").getText());
    pstmt.setString(25, cp1.get(Textfield.class, "Mo2").getText());
    pstmt.setString(26, cp1.get(Textfield.class, "Sn2").getText());
    pstmt.setString(27, cp1.get(Textfield.class, "Ve2").getText());
    pstmt.setString(28, cp1.get(Textfield.class, "Ma3").getText());
    pstmt.setString(29, cp1.get(Textfield.class, "Cl3").getText());
    pstmt.setString(30, cp1.get(Textfield.class, "Eq3").getText());
    pstmt.setString(31, cp1.get(Textfield.class, "Mo3").getText());
    pstmt.setString(32, cp1.get(Textfield.class, "Sn3").getText());
    pstmt.setString(33, cp1.get(Textfield.class, "Ve3").getText());
    pstmt.setString(34, cp1.get(Textfield.class, "Ma4").getText());
    pstmt.setString(35, cp1.get(Textfield.class, "Cl4").getText());
    pstmt.setString(36, cp1.get(Textfield.class, "Eq4").getText());
    pstmt.setString(37, cp1.get(Textfield.class, "Mo4").getText());
    pstmt.setString(38, cp1.get(Textfield.class, "Sn4").getText());
    pstmt.setString(39, cp1.get(Textfield.class, "Ve4").getText());
    pstmt.setString(40, cp1.get(Textfield.class, "Ma5").getText());
    pstmt.setString(41, cp1.get(Textfield.class, "Cl5").getText());
    pstmt.setString(42, cp1.get(Textfield.class, "Eq5").getText());
    pstmt.setString(43, cp1.get(Textfield.class, "Mo5").getText());
    pstmt.setString(44, cp1.get(Textfield.class, "Sn5").getText());
    pstmt.setString(45, cp1.get(Textfield.class, "Ve5").getText());
    pstmt.setString(46, cp1.get(Textfield.class, "Ma6").getText());
    pstmt.setString(47, cp1.get(Textfield.class, "Cl6").getText());
    pstmt.setString(48, cp1.get(Textfield.class, "Eq6").getText());
    pstmt.setString(49, cp1.get(Textfield.class, "Mo6").getText());
    pstmt.setString(50, cp1.get(Textfield.class, "Sn6").getText());
    pstmt.setString(51, cp1.get(Textfield.class, "Ve6").getText());
    pstmt.setString(52, cp1.get(Textfield.class, "Data1").getText());
    pstmt.setString(53, cp1.get(Textfield.class, "DeslT1").getText());
    pstmt.setString(54, cp1.get(Textfield.class, "DeslA1").getText());
    pstmt.setString(55, cp1.get(Textfield.class, "HorT1").getText());
    pstmt.setString(56, cp1.get(Textfield.class, "Diver1").getText());
    pstmt.setString(57, cp1.get(Textfield.class, "Total1").getText());
    pstmt.setString(58, cp1.get(Textfield.class, "Data2").getText());
    pstmt.setString(59, cp1.get(Textfield.class, "DeslT2").getText());
    pstmt.setString(60, cp1.get(Textfield.class, "DeslA2").getText());
    pstmt.setString(61, cp1.get(Textfield.class, "HorT2").getText());
    pstmt.setString(62, cp1.get(Textfield.class, "Diver2").getText());
    pstmt.setString(63, cp1.get(Textfield.class, "Total2").getText());
    pstmt.setString(64, cp1.get(Textfield.class, "Data3").getText());
    pstmt.setString(65, cp1.get(Textfield.class, "DeslT3").getText());
    pstmt.setString(66, cp1.get(Textfield.class, "DeslA3").getText());
    pstmt.setString(67, cp1.get(Textfield.class, "HorT3").getText());
    pstmt.setString(68, cp1.get(Textfield.class, "Diver3").getText());
    pstmt.setString(69, cp1.get(Textfield.class, "Total3").getText());
    pstmt.setString(70, cp1.get(Textfield.class, "Data4").getText());
    pstmt.setString(71, cp1.get(Textfield.class, "DeslT4").getText());
    pstmt.setString(72, cp1.get(Textfield.class, "DeslA4").getText());
    pstmt.setString(73, cp1.get(Textfield.class, "HorT4").getText());
    pstmt.setString(74, cp1.get(Textfield.class, "Diver4").getText());
    pstmt.setString(75, cp1.get(Textfield.class, "Total4").getText());
    pstmt.setString(76, cp1.get(Textfield.class, "Data5").getText());
    pstmt.setString(77, cp1.get(Textfield.class, "DeslT5").getText());
    pstmt.setString(78, cp1.get(Textfield.class, "DeslA5").getText());
    pstmt.setString(79, cp1.get(Textfield.class, "HorT5").getText());
    pstmt.setString(80, cp1.get(Textfield.class, "Diver5").getText());
    pstmt.setString(81, cp1.get(Textfield.class, "Total5").getText());
    pstmt.setString(82, cp1.get(Textfield.class, "Pedido1").getText());
    pstmt.setString(83, cp1.get(Textfield.class, "ContrPc1").getText());
    pstmt.setString(84, cp1.get(Textfield.class, "Item1").getText());
    pstmt.setString(85, cp1.get(Textfield.class, "Descr1").getText());
    pstmt.setString(86, cp1.get(Textfield.class, "Quantid1").getText());
    pstmt.setString(87, cp1.get(Textfield.class, "Detalhe1").getText());
    pstmt.setString(88, cp1.get(Textfield.class, "Pedido2").getText());
    pstmt.setString(89, cp1.get(Textfield.class, "ContrPc2").getText());
    pstmt.setString(90, cp1.get(Textfield.class, "Item2").getText());
    pstmt.setString(91, cp1.get(Textfield.class, "Descr2").getText());
    pstmt.setString(92, cp1.get(Textfield.class, "Quantid2").getText());
    pstmt.setString(93, cp1.get(Textfield.class, "Detalhe2").getText());
    pstmt.setString(94, cp1.get(Textfield.class, "Pedido3").getText());
    pstmt.setString(95, cp1.get(Textfield.class, "ContrPc3").getText());
    pstmt.setString(96, cp1.get(Textfield.class, "Item3").getText());
    pstmt.setString(97, cp1.get(Textfield.class, "Descr3").getText());
    pstmt.setString(98, cp1.get(Textfield.class, "Quantid3").getText());
    pstmt.setString(99, cp1.get(Textfield.class, "Detalhe3").getText());
    pstmt.setString(100, cp1.get(Textfield.class, "Pedido4").getText());
    pstmt.setString(101, cp1.get(Textfield.class, "ContrPc4").getText());
    pstmt.setString(102, cp1.get(Textfield.class, "Item4").getText());
    pstmt.setString(103, cp1.get(Textfield.class, "Descr4").getText());
    pstmt.setString(104, cp1.get(Textfield.class, "Quantid4").getText());
    pstmt.setString(105, cp1.get(Textfield.class, "Detalhe4").getText());
    pstmt.setString(106, cp1.get(Textfield.class, "Pedido5").getText());
    pstmt.setString(107, cp1.get(Textfield.class, "ContrPc5").getText());
    pstmt.setString(108, cp1.get(Textfield.class, "Item5").getText());
    pstmt.setString(109, cp1.get(Textfield.class, "Descr5").getText());
    pstmt.setString(110, cp1.get(Textfield.class, "Quantid5").getText());
    pstmt.setString(111, cp1.get(Textfield.class, "Detalhe5").getText());

   pstmt.executeUpdate();
    System.out.println("Dados salvos com sucesso.");
  } catch (SQLException e) {
    System.out.println("Erro ao salvar dados: " + e.getMessage());
  } finally {
    closeConnection();
  }
}

void loadData() {
  String selectQuery = "SELECT idt, contrato, endereco, sala, telefone FROM dados_gui LIMIT 5";
  try {
    conn = DriverManager.getConnection("jdbc:sqlite:" + dataPath("troper.db"));
    stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(selectQuery);
    int i = 1;
    while (rs.next()) {
      switch(i) {
      case 1:
        tfID_off1.setText(rs.getString("idt"));
        tfCon_off1.setText(rs.getString("contrato"));
        //tfInst_off1.setText(rs.getString("instituicao"));
        //tfEquip_off1.setText(rs.getString("equipamento"));
        //tfSn_off1.setText(rs.getString("numero_serie"));
        //tfPend_off1.setText(rs.getString("pendencia"));
        break;
      case 2:
        tfID_off2.setText(rs.getString("idt"));
        tfCon_off2.setText(rs.getString("contrato"));
        //tfInst_off2.setText(rs.getString("instituicao"));
        //tfEquip_off2.setText(rs.getString("equipamento"));
        //tfSn_off2.setText(rs.getString("numero_serie"));
        //tfPend_off2.setText(rs.getString("pendencia"));
        break;
      case 3:
        tfID_off3.setText(rs.getString("idt"));
        tfCon_off3.setText(rs.getString("contrato"));
        //tfInst_off3.setText(rs.getString("instituicao"));
        //tfEquip_off3.setText(rs.getString("equipamento"));
        //tfSn_off3.setText(rs.getString("numero_serie"));
        //tfPend_off3.setText(rs.getString("pendencia"));
        break;
      case 4:
        tfID_off4.setText(rs.getString("idt"));
        tfCon_off4.setText(rs.getString("contrato"));
        //tfInst_off4.setText(rs.getString("instituicao"));
        //tfEquip_off4.setText(rs.getString("equipamento"));
        //tfSn_off4.setText(rs.getString("numero_serie"));
        //tfPend_off4.setText(rs.getString("pendencia"));
        break;
      case 5:
        tfID_off5.setText(rs.getString("idt"));
        tfCon_off5.setText(rs.getString("contrato"));
        //tfInst_off5.setText(rs.getString("instituicao"));
        //tfEquip_off5.setText(rs.getString("equipamento"));
        //tfSn_off5.setText(rs.getString("numero_serie"));
        //tfPend_off5.setText(rs.getString("pendencia"));
        break;
      }
      i++;
    }
  }
  catch (SQLException e) {
    println("Erro ao carregar dados: " + e.getMessage());
  } finally {
    closeConnection();
  }
}

void loadDetails(int id) {
  String selectQuery = "SELECT * FROM dados_gui WHERE id = ?";
  try {
    conn = DriverManager.getConnection("jdbc:sqlite:" + dataPath("troper.db"));
    PreparedStatement pstmt = conn.prepareStatement(selectQuery);
    pstmt.setInt(1, id);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
      cp1.get(Textfield.class, "Endereco").setText(rs.getString("endereco"));
      cp1.get(Textfield.class, "Campus").setText(rs.getString("campus"));
      cp1.get(Textfield.class, "Bloco").setText(rs.getString("bloco"));
      cp1.get(Textfield.class, "Sala").setText(rs.getString("sala"));
      cp1.get(Textfield.class, "BairroDistrito").setText(rs.getString("bairro"));
      cp1.get(Textfield.class, "Cidade").setText(rs.getString("cidade"));
      cp1.get(Textfield.class, "CEP").setText(rs.getString("cep"));
      cp1.get(Textfield.class, "Telefone").setText(rs.getString("telefone"));
      cp1.get(Textfield.class, "Ramal").setText(rs.getString("ramal"));
      cp1.get(Textfield.class, "Email").setText(rs.getString("email"));
      cp1.get(Textfield.class, "ID").setText(rs.getString("idt"));
      cp1.get(Textfield.class, "Chamado").setText(rs.getString("chamado"));
      cp1.get(Textfield.class, "Contrato").setText(rs.getString("contrato"));
      cp1.get(Textfield.class, "Contato").setText(rs.getString("contato"));
      cp1.get(Textfield.class, "Responsavel").setText(rs.getString("responsavel"));
      cp1.get(Textfield.class, "Ma1").setText(rs.getString("ma1"));
      cp1.get(Textfield.class, "Cl1").setText(rs.getString("cl1"));
      cp1.get(Textfield.class, "Eq1").setText(rs.getString("eq1"));
      cp1.get(Textfield.class, "Mo1").setText(rs.getString("mo1"));
      cp1.get(Textfield.class, "Sn1").setText(rs.getString("sn1"));
      cp1.get(Textfield.class, "Ve1").setText(rs.getString("ve1"));
      cp1.get(Textfield.class, "Ma2").setText(rs.getString("ma2"));
      cp1.get(Textfield.class, "Cl2").setText(rs.getString("cl2"));
      cp1.get(Textfield.class, "Eq2").setText(rs.getString("eq2"));
      cp1.get(Textfield.class, "Mo2").setText(rs.getString("mo2"));
      cp1.get(Textfield.class, "Sn2").setText(rs.getString("sn2"));
      cp1.get(Textfield.class, "Ve2").setText(rs.getString("ve2"));
      cp1.get(Textfield.class, "Ma3").setText(rs.getString("ma3"));
      cp1.get(Textfield.class, "Cl3").setText(rs.getString("cl3"));
      cp1.get(Textfield.class, "Eq3").setText(rs.getString("eq3"));
      cp1.get(Textfield.class, "Mo3").setText(rs.getString("mo3"));
      cp1.get(Textfield.class, "Sn3").setText(rs.getString("sn3"));
      cp1.get(Textfield.class, "Ve3").setText(rs.getString("ve3"));
      cp1.get(Textfield.class, "Ma4").setText(rs.getString("ma4"));
      cp1.get(Textfield.class, "Cl4").setText(rs.getString("cl4"));
      cp1.get(Textfield.class, "Eq4").setText(rs.getString("eq4"));
      cp1.get(Textfield.class, "Mo4").setText(rs.getString("mo4"));
      cp1.get(Textfield.class, "Sn4").setText(rs.getString("sn4"));
      cp1.get(Textfield.class, "Ve4").setText(rs.getString("ve4"));
      cp1.get(Textfield.class, "Ma5").setText(rs.getString("ma5"));
      cp1.get(Textfield.class, "Cl5").setText(rs.getString("cl5"));
      cp1.get(Textfield.class, "Eq5").setText(rs.getString("eq5"));
      cp1.get(Textfield.class, "Mo5").setText(rs.getString("mo5"));
      cp1.get(Textfield.class, "Sn5").setText(rs.getString("sn5"));
      cp1.get(Textfield.class, "Ve5").setText(rs.getString("ve5"));
      cp1.get(Textfield.class, "Ma6").setText(rs.getString("ma6"));
      cp1.get(Textfield.class, "Cl6").setText(rs.getString("cl6"));
      cp1.get(Textfield.class, "Eq6").setText(rs.getString("eq6"));
      cp1.get(Textfield.class, "Mo6").setText(rs.getString("mo6"));
      cp1.get(Textfield.class, "Sn6").setText(rs.getString("sn6"));
      cp1.get(Textfield.class, "Ve6").setText(rs.getString("ve6"));
      cp1.get(Textfield.class, "Data1").setText(rs.getString("data1"));
      cp1.get(Textfield.class, "DeslT1").setText(rs.getString("deslt1"));
      cp1.get(Textfield.class, "DeslA1").setText(rs.getString("desla1"));
      cp1.get(Textfield.class, "HorT1").setText(rs.getString("hort1"));
      cp1.get(Textfield.class, "Diver1").setText(rs.getString("diver1"));
      cp1.get(Textfield.class, "Total1").setText(rs.getString("total1"));
      cp1.get(Textfield.class, "Data2").setText(rs.getString("data2"));
      cp1.get(Textfield.class, "DeslT2").setText(rs.getString("deslt2"));
      cp1.get(Textfield.class, "DeslA2").setText(rs.getString("desla2"));
      cp1.get(Textfield.class, "HorT2").setText(rs.getString("hort2"));
      cp1.get(Textfield.class, "Diver2").setText(rs.getString("diver2"));
      cp1.get(Textfield.class, "Total2").setText(rs.getString("total2"));
      cp1.get(Textfield.class, "Data3").setText(rs.getString("data3"));
      cp1.get(Textfield.class, "DeslT3").setText(rs.getString("deslt3"));
      cp1.get(Textfield.class, "DeslA3").setText(rs.getString("desla3"));
      cp1.get(Textfield.class, "HorT3").setText(rs.getString("hort3"));
      cp1.get(Textfield.class, "Diver3").setText(rs.getString("diver3"));
      cp1.get(Textfield.class, "Total3").setText(rs.getString("total3"));
      cp1.get(Textfield.class, "Data4").setText(rs.getString("data4"));
      cp1.get(Textfield.class, "DeslT4").setText(rs.getString("deslt4"));
      cp1.get(Textfield.class, "DeslA4").setText(rs.getString("desla4"));
      cp1.get(Textfield.class, "HorT4").setText(rs.getString("hort4"));
      cp1.get(Textfield.class, "Diver4").setText(rs.getString("diver4"));
      cp1.get(Textfield.class, "Total4").setText(rs.getString("total4"));
      cp1.get(Textfield.class, "Data5").setText(rs.getString("data5"));
      cp1.get(Textfield.class, "DeslT5").setText(rs.getString("deslt5"));
      cp1.get(Textfield.class, "DeslA5").setText(rs.getString("desla5"));
      cp1.get(Textfield.class, "HorT5").setText(rs.getString("hort5"));
      cp1.get(Textfield.class, "Diver5").setText(rs.getString("diver5"));
      cp1.get(Textfield.class, "Total5").setText(rs.getString("total5"));
      cp1.get(Textfield.class, "Pedido1").setText(rs.getString("pedido1"));
      cp1.get(Textfield.class, "ContrPc1").setText(rs.getString("contrpc1"));
      cp1.get(Textfield.class, "Item1").setText(rs.getString("item1"));
      cp1.get(Textfield.class, "Descr1").setText(rs.getString("descr1"));
      cp1.get(Textfield.class, "Quantid1").setText(rs.getString("quantid1"));
      cp1.get(Textfield.class, "Detalhe1").setText(rs.getString("detalhe1"));
      cp1.get(Textfield.class, "Pedido2").setText(rs.getString("pedido2"));
      cp1.get(Textfield.class, "ContrPc2").setText(rs.getString("contrpc2"));
      cp1.get(Textfield.class, "Item2").setText(rs.getString("item2"));
      cp1.get(Textfield.class, "Descr2").setText(rs.getString("descr2"));
      cp1.get(Textfield.class, "Quantid2").setText(rs.getString("quantid2"));
      cp1.get(Textfield.class, "Detalhe2").setText(rs.getString("detalhe2"));
      cp1.get(Textfield.class, "Pedido3").setText(rs.getString("pedido3"));
      cp1.get(Textfield.class, "ContrPc3").setText(rs.getString("contrpc3"));
      cp1.get(Textfield.class, "Item3").setText(rs.getString("item3"));
      cp1.get(Textfield.class, "Descr3").setText(rs.getString("descr3"));
      cp1.get(Textfield.class, "Quantid3").setText(rs.getString("quantid3"));
      cp1.get(Textfield.class, "Detalhe3").setText(rs.getString("detalhe3"));
      cp1.get(Textfield.class, "Pedido4").setText(rs.getString("pedido4"));
      cp1.get(Textfield.class, "ContrPc4").setText(rs.getString("contrpc4"));
      cp1.get(Textfield.class, "Item4").setText(rs.getString("item4"));
      cp1.get(Textfield.class, "Descr4").setText(rs.getString("descr4"));
      cp1.get(Textfield.class, "Quantid4").setText(rs.getString("quantid4"));
      cp1.get(Textfield.class, "Detalhe4").setText(rs.getString("detalhe4"));
      cp1.get(Textfield.class, "Pedido5").setText(rs.getString("pedido5"));
      cp1.get(Textfield.class, "ContrPc5").setText(rs.getString("contrpc5"));
      cp1.get(Textfield.class, "Item5").setText(rs.getString("item5"));
      cp1.get(Textfield.class, "Descr5").setText(rs.getString("descr5"));
      cp1.get(Textfield.class, "Quantid5").setText(rs.getString("quantid5"));
      cp1.get(Textfield.class, "Detalhe5").setText(rs.getString("detalhe5"));
    }
  }
  catch (SQLException e) {
    println("Erro ao carregar detalhes: " + e.getMessage());
  }finally {
    closeConnection();
  }
}

void closeConnection() {
  try {
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
  } catch (SQLException e) {
    System.out.println("Erro ao fechar a conexão: " + e.getMessage());
  }
}
