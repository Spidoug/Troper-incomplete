
public PImage[] loadImages(String... paths) {
  // Load images from specified paths
  PImage[] images = new PImage[paths.length];
  for (int i = 0; i < paths.length; i++) {
    try {
      images[i] = loadImage(topSketchPath + paths[i]);
      if (images[i] == null) {
        System.err.println("Error: Failed to load image at path: " + topSketchPath + paths[i]);
      }
    }
    catch (Exception e) {
      System.err.println("Exception while loading image at path: " + topSketchPath + paths[i]);
      e.printStackTrace();
    }
  }
  return images;
}


public void createusermain() {
  // Initialize the GUI for creating a user
  login = true;
  modelogin = false;
  modemanageruser = 1;
  user.setLock(false);
  password.setLock(false);
  //createuser.hide();
  //deleteuser.show();
  //upuser.hide();
  //downuser.hide();
  password.show();
  window2 = "Create User";
  Systeminfo = "";
  isTabPressed = false;
  user.setText("");
  password.setText("");
  user.setFocus(true);
  password.setFocus(false);
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Nenhum arquivo foi selecionado.");
    selectedFilePath = null;
  } else {
    println("Arquivo selecionado: " + selection.getAbsolutePath());
    selectedFilePath = selection.getAbsolutePath();
  }
}

void fileSave(File selection) {
  if (selection == null) {
    println("Nenhum local de salvamento foi selecionado.");
    saveFilePath = null;
  } else {
    println("Arquivo será salvo em: " + selection.getAbsolutePath());
    saveFilePath = selection.getAbsolutePath();

    // Exemplo: salvando algo no arquivo
    saveData(saveFilePath);
  }
}

void saveData(String path) {
  // Exemplo de dados para salvar
  String[] data = { "Linha 1", "Linha 2", "Linha 3" };

  // Salva os dados no arquivo
  saveStrings(path, data);
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    activeTab = theControlEvent.getTab().getId();
  }

  if (theControlEvent.isTab() && theControlEvent.getTab().getName().equals("Base de Dados")) {
    loadData(); // Carregar os dados do banco de dados ao clicar na aba "Base de Dados"
  }
  if (theControlEvent.isFrom(tfID_off1) && theControlEvent.getTab().getName().equals("Base de Dados")) {
    loadDetails(Integer.parseInt(tfID_off1.getText()));
  }
  if (theControlEvent.isFrom(tfID_off2) && theControlEvent.getTab().getName().equals("Base de Dados")) {
    loadDetails(Integer.parseInt(tfID_off2.getText()));
  }
  if (theControlEvent.isFrom(tfID_off3) && theControlEvent.getTab().getName().equals("Base de Dados")) {
    loadDetails(Integer.parseInt(tfID_off3.getText()));
  }
  if (theControlEvent.isFrom(tfID_off4) && theControlEvent.getTab().getName().equals("Base de Dados")) {
    loadDetails(Integer.parseInt(tfID_off4.getText()));
  }
  if (theControlEvent.isFrom(tfID_off5) && theControlEvent.getTab().getName().equals("Base de Dados")) {
    loadDetails(Integer.parseInt(tfID_off5.getText()));
  }
}

// Get a configuration value as a string
String getConfigurationString(String id) {
  String r = "";
  try {
    r = dados.getString(id);
  }
  catch (Exception e) {
    r = "";
  }
  return r;
}

void createPDFWindow() {
  PGraphics pdf = createGraphics(595, 842, PDF, "output.pdf"); // 595x842 é o tamanho A4 em pontos
  pdf.beginDraw();

  Desenhafolha(pdf); // Desenha o conteúdo no PDF

  pdf.endDraw();
  pdf.dispose();

  println("PDF saved as 'output.pdf'");
}

void Desenhafolha(PGraphics pdf) {
  pdf.fill(0);
  pdf.textAlign(LEFT, TOP);

  // Título
  pdf.textSize(24);
  pdf.text("Sample PDF Document", 50, 50);

  // Texto simples
  pdf.textSize(14);
  pdf.text("This is a sample document created in Processing.", 50, 100);
  pdf.text("It includes various elements like text, tables, lists, and figures.", 50, 120);

  // Lista
  pdf.textSize(14);
  String[] listItems = {"Item 1: Description of item 1", "Item 2: Description of item 2", "Item 3: Description of item 3"};
  int y = 160;
  for (int i = 0; i < listItems.length; i++) {
    pdf.text("- " + listItems[i], 50, y);
    y += 20;
  }

  // Tabela
  pdf.textSize(14);
  String[] tableHeaders = {"Header 1", "Header 2", "Header 3"};
  String[][] tableData = {
    {"Data 1", "Data 2", "Data 3"},
    {"Data A", "Data B", "Data C"},
    {"Data X", "Data Y", "Data Z"}
  };

  y = 240;
  int x = 50;

  for (int i = 0; i < tableHeaders.length; i++) {
    pdf.text(tableHeaders[i], x + i * 100, y);
  }

  y += 20;

  for (int i = 0; i < tableData.length; i++) {
    for (int j = 0; j < tableData[i].length; j++) {
      pdf.text(tableData[i][j], x + j * 100, y);
    }
    y += 20;
  }

  // Figura
  pdf.noFill();
  pdf.rect(50, 350, 200, 100); // Exemplo de uma figura (retângulo)
  pdf.textSize(12);
  pdf.text("Figure 1: Example rectangle", 50, 460);

  // Outras figuras e conteúdos podem ser adicionados aqui
}

class Button {
  String label;
  float x, y, w, h;

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    fill(200);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }

  boolean isClicked(float mx, float my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }
}
