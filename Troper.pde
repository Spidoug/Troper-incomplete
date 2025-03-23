/*  //////////////////////////////////////////////////////////////////TROPER® VERSION 1.00/////////////////////////////////////////////////////////////////////////
 
 SOFTWARE DEVELOPED BY DOUGLAS SANTANA
 CONTACT EMAIL: SPIDOUG@GMAIL.COM
 
 THIS PROGRAM HAS THE FUNCTION OF MANAGING A CUSTOMER DATA MANAGEMENT PLATFORM FOR A COMPANY ON AN SQL DATABASE.
 */

// Import libraries
import java.io.IOException;
import java.nio.file.Paths;
import controlP5.*;
import g4p_controls.*;
import java.security.MessageDigest;
import java.awt.MouseInfo;
import java.awt.Point;
import processing.awt.PSurfaceAWT;

import java.sql.*;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.io.File;

import processing.pdf.*;

int equipamentolista = 1;
int horaslista = 1;
int pecaslista = 1;
int relatoriolistaoff = 1;
int relatoriolistaon = 1;
int activeTab;

int modemanageruser = 0;

float n;

int dotb = 0;

String topSketchPath = "";
String Systeminfo = " Press F1 for help";

String userid = null;
String passwordid = null;
String valueps;

boolean isTabPressed = false;

JSONObject dados;
JSONObject copiadados;

String window1 = "Troper®";
String window2 = "Troper® - Login";

String selectedFilePath;
String saveFilePath;

boolean modelogin = false;
boolean admin = true;
boolean login = true;

String secretKey = "8982965338197651";

String[] properties = null;

int primaryX = 0;
int primaryY = 0;

PSurfaceAWT awtSurface;
PSurfaceAWT.SmoothCanvas smoothCanvas;

GTextArea relat;
GTextArea historico;

ControlP5 cp1;
ControlP5 cp2;

//PWindowl winlogin;
PWindowAss winass;

Connection conn;
Statement stmt;

ScrollableList instituicao, instituto, departamento, laboratório, estado, pais, tipo, servico, marca, classe, equipamento, modelo;

Textfield endereco, campus, bloco, sala, bairrodistrito, cidade, cep, telefone, ramal, email, id, chamado, contrato, contato, responsavel;
Textfield ma1, cl1, eq1, mo1, sn1, ve1;
Textfield ma2, cl2, eq2, mo2, sn2, ve2;
Textfield ma3, cl3, eq3, mo3, sn3, ve3;
Textfield ma4, cl4, eq4, mo4, sn4, ve4;
Textfield ma5, cl5, eq5, mo5, sn5, ve5;
Textfield ma6, cl6, eq6, mo6, sn6, ve6;
Textfield data1, deslT1, deslA1, horT1, diver1, total1;
Textfield data2, deslT2, deslA2, horT2, diver2, total2;
Textfield data3, deslT3, deslA3, horT3, diver3, total3;
Textfield data4, deslT4, deslA4, horT4, diver4, total4;
Textfield data5, deslT5, deslA5, horT5, diver5, total5;
Textfield pedido1, contrPc1, item1, descr1, quantid1, detalhe1;
Textfield pedido2, contrPc2, item2, descr2, quantid2, detalhe2;
Textfield pedido3, contrPc3, item3, descr3, quantid3, detalhe3;
Textfield pedido4, contrPc4, item4, descr4, quantid4, detalhe4;
Textfield pedido5, contrPc5, item5, descr5, quantid5, detalhe5;

Textfield tfID_off1, tfCon_off1, tfInst_off1, tfEquip_off1, tfSn_off1, tfPend_off1, tfID_off2, tfCon_off2, tfInst_off2, tfEquip_off2, tfSn_off2, tfPend_off2, tfID_off3, tfCon_off3, tfInst_off3, tfEquip_off3, tfSn_off3, tfPend_off3, tfID_off4, tfCon_off4, tfInst_off4, tfEquip_off4, tfSn_off4, tfPend_off4, tfID_off5, tfCon_off5, tfInst_off5, tfEquip_off5, tfSn_off5, tfPend_off5;

Button downuser;
Button upuser;
Button cancel;
Button ok;
Button deletedtbt;
Button opendtbt;
Button createuser;
Button deleteuser;

Textfield user;
Textfield password;

Textlabel idoff, contoff, intoff, equipmoff, snoff, pendoff;

void setup() {

  surface.setVisible(!modelogin);
  smooth(2);

  surface.setTitle(window1);
  size(1000, 600);

  topSketchPath = sketchPath();

  //dados = new JSONObject();

  PImage[] novo = loadImages("/src/novo_a.png", "/src/novo_b.png", "/src/novo_c.png");
  PImage[] abrir = loadImages("/src/abrir_a.png", "/src/abrir_b.png", "/src/abrir_c.png");
  PImage[] copiar = loadImages("/src/copiar_a.png", "/src/copiar_b.png", "/src/copiar_c.png");
  PImage[] colar = loadImages("/src/colar_a.png", "/src/colar_b.png", "/src/colar_c.png");
  PImage[] arquivar = loadImages("/src/arquivar_a.png", "/src/arquivar_b.png", "/src/arquivar_c.png");
  PImage[] assinar = loadImages("/src/assinar_a.png", "/src/assinar_b.png", "/src/assinar_c.png");
  PImage[] pdf = loadImages("/src/pdf_a.png", "/src/pdf_b.png", "/src/pdf_c.png");
  PImage[] salvar = loadImages("/src/salvar_a.png", "/src/salvar_b.png", "/src/salvar_c.png");
  PImage[] Adicionar = loadImages("/src/adicionar_a.png", "/src/adicionar_b.png", "/src/adicionar_c.png");
  PImage[] Retirar = loadImages("/src/retirar_a.png", "/src/retirar_b.png", "/src/retirar_c.png");

  cp1 = new ControlP5(this);
  cp1.getTab("default").setLabel("Estabelecimento").activateEvent(true).setId(0).setWidth(115).setHeight(30).setColorForeground(#CBCBBD).setColorBackground(#A5A0A0).setColorActive(#EAEAEA).setColorLabel(190).getCaptionLabel().setFont(createFont("impact", 13, true)).align(CENTER, CENTER);
  cp1.getTab("Laudo").setLabel("Laudo").activateEvent(true).setId(1).setWidth(56).setHeight(30).setColorForeground(#CBCBBD).setColorBackground(#A5A0A0).setColorActive(#EAEAEA).setColorLabel(190).getCaptionLabel().setFont(createFont("impact", 13, true)).align(CENTER, CENTER);
  cp1.getTab("Itens").setLabel("Itens").activateEvent(true).setId(2).setWidth(51).setHeight(30).setColorForeground(#CBCBBD).setColorBackground(#A5A0A0).setColorActive(#EAEAEA).setColorLabel(190).getCaptionLabel().setFont(createFont("impact", 13, true)).align(CENTER, CENTER);
  cp1.getTab("Base de Dados").setLabel("Base de Dados").activateEvent(true).setId(3).setWidth(103).setHeight(30).setColorForeground(#CBCBBD).setColorBackground(#A5A0A0).setColorActive(#EAEAEA).setColorLabel(190).getCaptionLabel().setFont(createFont("impact", 13, true)).align(CENTER, CENTER);

  endereco = cp1.addTextfield("Endereco").setLabel("Endereço").setPosition(30, 100).setColorCaptionLabel(0).setSize(300, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  campus = cp1.addTextfield("Campus").setLabel("Campus").setPosition(340, 100).setColorCaptionLabel(0).setSize(200, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  bloco = cp1.addTextfield("Bloco").setLabel("Bloco").setPosition(550, 100).setColorCaptionLabel(0).setSize(200, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  sala = cp1.addTextfield("Sala").setLabel("Sala").setPosition(760, 100).setColorCaptionLabel(0).setSize(210, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  bairrodistrito = cp1.addTextfield("BairroDistrito").setLabel("Bairro/Distrito").setPosition(30, 150).setColorCaptionLabel(0).setSize(300, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cidade = cp1.addTextfield("Cidade").setLabel("Cidade").setPosition(340, 150).setColorCaptionLabel(0).setSize(200, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cep = cp1.addTextfield("CEP").setLabel("CEP").setPosition(30, 200).setColorCaptionLabel(0).setSize(300, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  telefone = cp1.addTextfield("Telefone").setLabel("Telefone").setPosition(340, 200).setColorCaptionLabel(0).setSize(200, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  ramal = cp1.addTextfield("Ramal").setLabel("Ramal").setPosition(550, 200).setColorCaptionLabel(0).setSize(200, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  email = cp1.addTextfield("Email").setLabel("E-mail").setPosition(760, 200).setColorCaptionLabel(0).setSize(210, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  id = cp1.addTextfield("ID").setLabel("ID").setPosition(30, 555).setColorCaptionLabel(0).setSize(100, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  chamado = cp1.addTextfield("Chamado").setLabel("Chamado").setPosition(310, 555).setColorCaptionLabel(0).setSize(100, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  contrato = cp1.addTextfield("Contrato").setLabel("Contrato").setPosition(420, 555).setColorCaptionLabel(0).setSize(70, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  contato = cp1.addTextfield("Contato").setLabel("Contato").setPosition(550, 555).setColorCaptionLabel(0).setSize(200, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  responsavel = cp1.addTextfield("Responsavel").setLabel("Responsável").setPosition(760, 555).setColorCaptionLabel(0).setSize(210, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  cp1.addTextlabel("Cliente").setText("Cliente").setPosition(480, 258).setColor(230).setFont(createFont("Georgia", 14));
  cp1.addTextlabel("Equipamentos").setText("Equipamento").setPosition(460, 528).setColor(230).setFont(createFont("Georgia", 14));

  cp1.addTextlabel("Cronograma").setText("Cronograma").setPosition(470, 258).setColor(230).setFont(createFont("Georgia", 14));
  cp1.addTextlabel("Relatorio").setText("Relatório").setPosition(480, 528).setColor(230).setFont(createFont("Georgia", 14));

  cp1.addTextlabel("Suprimentos").setText("Suprimentos").setPosition(470, 258).setColor(230).setFont(createFont("Georgia", 14));
  cp1.addTextlabel("Histo").setText("Histórico").setPosition(480, 528).setColor(230).setFont(createFont("Georgia", 14));

  cp1.addTextlabel("Offline").setText("Offline").setPosition(480, 258).setColor(230).setFont(createFont("Georgia", 14));
  cp1.addTextlabel("Online").setText("Online").setPosition(480, 528).setColor(230).setFont(createFont("Georgia", 14));

  ma1 = cp1.addTextfield("Ma1").setLabel("").setPosition(30, 350).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cl1 = cp1.addTextfield("Cl1").setLabel("").setPosition(190, 350).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  eq1 = cp1.addTextfield("Eq1").setLabel("").setPosition(350, 350).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  mo1 = cp1.addTextfield("Mo1").setLabel("").setPosition(510, 350).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  sn1 = cp1.addTextfield("Sn1").setLabel("").setPosition(670, 350).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  ve1 = cp1.addTextfield("Ve1").setLabel("").setPosition(830, 350).setColorCaptionLabel(0).setSize(140, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  ma2 = cp1.addTextfield("Ma2").setLabel("").setPosition(30, 370).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cl2 = cp1.addTextfield("Cl2").setLabel("").setPosition(190, 370).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  eq2 = cp1.addTextfield("Eq2").setLabel("").setPosition(350, 370).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  mo2 = cp1.addTextfield("Mo2").setLabel("").setPosition(510, 370).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  sn2 = cp1.addTextfield("Sn2").setLabel("").setPosition(670, 370).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  ve2 = cp1.addTextfield("Ve2").setLabel("").setPosition(830, 370).setColorCaptionLabel(0).setSize(140, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  ma3 = cp1.addTextfield("Ma3").setLabel("").setPosition(30, 390).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cl3 = cp1.addTextfield("Cl3").setLabel("").setPosition(190, 390).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  eq3 = cp1.addTextfield("Eq3").setLabel("").setPosition(350, 390).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  mo3 = cp1.addTextfield("Mo3").setLabel("").setPosition(510, 390).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  sn3 = cp1.addTextfield("Sn3").setLabel("").setPosition(670, 390).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  ve3 = cp1.addTextfield("Ve3").setLabel("").setPosition(830, 390).setColorCaptionLabel(0).setSize(140, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  ma4 = cp1.addTextfield("Ma4").setLabel("").setPosition(30, 410).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cl4 = cp1.addTextfield("Cl4").setLabel("").setPosition(190, 410).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  eq4 = cp1.addTextfield("Eq4").setLabel("").setPosition(350, 410).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  mo4 = cp1.addTextfield("Mo4").setLabel("").setPosition(510, 410).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  sn4 = cp1.addTextfield("Sn4").setLabel("").setPosition(670, 410).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  ve4 = cp1.addTextfield("Ve4").setLabel("").setPosition(830, 410).setColorCaptionLabel(0).setSize(140, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  ma5 = cp1.addTextfield("Ma5").setLabel("").setPosition(30, 430).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cl5 = cp1.addTextfield("Cl5").setLabel("").setPosition(190, 430).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  eq5 = cp1.addTextfield("Eq5").setLabel("").setPosition(350, 430).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  mo5 = cp1.addTextfield("Mo5").setLabel("").setPosition(510, 430).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  sn5 = cp1.addTextfield("Sn5").setLabel("").setPosition(670, 430).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  ve5 = cp1.addTextfield("Ve5").setLabel("").setPosition(830, 430).setColorCaptionLabel(0).setSize(140, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  ma6 = cp1.addTextfield("Ma6").setLabel("").setPosition(30, 450).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cl6 = cp1.addTextfield("Cl6").setLabel("").setPosition(190, 450).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  eq6 = cp1.addTextfield("Eq6").setLabel("").setPosition(350, 450).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  mo6 = cp1.addTextfield("Mo6").setLabel("").setPosition(510, 450).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  sn6 = cp1.addTextfield("Sn6").setLabel("").setPosition(670, 450).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  ve6 = cp1.addTextfield("Ve6").setLabel("").setPosition(830, 450).setColorCaptionLabel(0).setSize(140, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  cp1.addTextlabel("Data").setText("* Data").setPosition(40, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("DeslT").setText("* Deslocamento Terrestre").setPosition(190, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("DeslA").setText("* Deslocamento Aéreo").setPosition(350, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("HorT").setText("* Horas de Trabalho").setPosition(510, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Diver").setText("* Diversos").setPosition(670, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Total").setText("* Total do Dia").setPosition(830, 55).setColor(0).setFont(createFont("Georgia", 13));

  data1 = cp1.addTextfield("Data1").setLabel("").setPosition(40, 85).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  deslT1 = cp1.addTextfield("DeslT1").setLabel("").setPosition(190, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  deslA1 = cp1.addTextfield("DeslA1").setLabel("").setPosition(350, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  horT1 = cp1.addTextfield("HorT1").setLabel("").setPosition(510, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  diver1 = cp1.addTextfield("Diver1").setLabel("").setPosition(670, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  total1 = cp1.addTextfield("Total1").setLabel("").setPosition(830, 85).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  data2 = cp1.addTextfield("Data2").setLabel("").setPosition(40, 105).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslT2 = cp1.addTextfield("DeslT2").setLabel("").setPosition(190, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslA2 = cp1.addTextfield("DeslA2").setLabel("").setPosition(350, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  horT2 = cp1.addTextfield("HorT2").setLabel("").setPosition(510, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  diver2 = cp1.addTextfield("Diver2").setLabel("").setPosition(670, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  total2 = cp1.addTextfield("Total2").setLabel("").setPosition(830, 105).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  data3 = cp1.addTextfield("Data3").setLabel("").setPosition(40, 125).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslT3 = cp1.addTextfield("DeslT3").setLabel("").setPosition(190, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslA3 = cp1.addTextfield("DeslA3").setLabel("").setPosition(350, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  horT3 = cp1.addTextfield("HorT3").setLabel("").setPosition(510, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  diver3 = cp1.addTextfield("Diver3").setLabel("").setPosition(670, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  total3 = cp1.addTextfield("Total3").setLabel("").setPosition(830, 125).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  data4 = cp1.addTextfield("Data4").setLabel("").setPosition(40, 145).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslT4 = cp1.addTextfield("DeslT4").setLabel("").setPosition(190, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslA4 = cp1.addTextfield("DeslA4").setLabel("").setPosition(350, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  horT4 = cp1.addTextfield("HorT4").setLabel("").setPosition(510, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  diver4 = cp1.addTextfield("Diver4").setLabel("").setPosition(670, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  total4 = cp1.addTextfield("Total4").setLabel("").setPosition(830, 145).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  data5 = cp1.addTextfield("Data5").setLabel("").setPosition(40, 165).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslT5 = cp1.addTextfield("DeslT5").setLabel("").setPosition(190, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  deslA5 = cp1.addTextfield("DeslA5").setLabel("").setPosition(350, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  horT5 = cp1.addTextfield("HorT5").setLabel("").setPosition(510, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  diver5 = cp1.addTextfield("Diver5").setLabel("").setPosition(670, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  total5 = cp1.addTextfield("Total5").setLabel("").setPosition(830, 165).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  cp1.addTextlabel("Pedido").setText("* Pedido").setPosition(40, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("ContrPc").setText("* Contrato").setPosition(190, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Item").setText("* Item").setPosition(350, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Descr").setText("* Identificação").setPosition(510, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Quantid").setText("* Quantidade").setPosition(670, 55).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Detalhe").setText("* Detalhe").setPosition(830, 55).setColor(0).setFont(createFont("Georgia", 13));

  pedido1 = cp1.addTextfield("Pedido1").setLabel("").setPosition(40, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  contrPc1 = cp1.addTextfield("ContrPc1").setLabel("").setPosition(190, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  item1 = cp1.addTextfield("Item1").setLabel("").setPosition(350, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  descr1 = cp1.addTextfield("Descr1").setLabel("").setPosition(510, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  quantid1 = cp1.addTextfield("Quantid1").setLabel("").setPosition(670, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  detalhe1 = cp1.addTextfield("Detalhe1").setLabel("").setPosition(830, 85).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  pedido2 = cp1.addTextfield("Pedido2").setLabel("").setPosition(40, 105).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  contrPc2 = cp1.addTextfield("ContrPc2").setLabel("").setPosition(190, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  item2 = cp1.addTextfield("Item2").setLabel("").setPosition(350, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  descr2 = cp1.addTextfield("Descr2").setLabel("").setPosition(510, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  quantid2 = cp1.addTextfield("Quantid2").setLabel("").setPosition(670, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  detalhe2 = cp1.addTextfield("Detalhe2").setLabel("").setPosition(830, 105).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  pedido3 = cp1.addTextfield("Pedido3").setLabel("").setPosition(40, 125).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  contrPc3 = cp1.addTextfield("ContrPc3").setLabel("").setPosition(190, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  item3 = cp1.addTextfield("Item3").setLabel("").setPosition(350, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  descr3 = cp1.addTextfield("Descr3").setLabel("").setPosition(510, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  quantid3 = cp1.addTextfield("Quantid3").setLabel("").setPosition(670, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  detalhe3 = cp1.addTextfield("Detalhe3").setLabel("").setPosition(830, 125).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  pedido4 = cp1.addTextfield("Pedido4").setLabel("").setPosition(40, 145).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  contrPc4 = cp1.addTextfield("ContrPc4").setLabel("").setPosition(190, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  item4 = cp1.addTextfield("Item4").setLabel("").setPosition(350, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  descr4 = cp1.addTextfield("Descr4").setLabel("").setPosition(510, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  quantid4 = cp1.addTextfield("Quantid4").setLabel("").setPosition(670, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  detalhe4 = cp1.addTextfield("Detalhe4").setLabel("").setPosition(830, 145).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  pedido5 = cp1.addTextfield("Pedido5").setLabel("").setPosition(40, 165).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  contrPc5 = cp1.addTextfield("ContrPc5").setLabel("").setPosition(190, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  item5 = cp1.addTextfield("Item5").setLabel("").setPosition(350, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  descr5 = cp1.addTextfield("Descr5").setLabel("").setPosition(510, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  quantid5 = cp1.addTextfield("Quantid5").setLabel("").setPosition(670, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  detalhe5 = cp1.addTextfield("Detalhe5").setLabel("").setPosition(830, 165).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  idoff = cp1.addTextlabel("ID_off").setText("* ID").setPosition(40, 55).setColor(0).setFont(createFont("Georgia", 13));
  contoff = cp1.addTextlabel("Con_off").setText("* Contrato").setPosition(190, 55).setColor(0).setFont(createFont("Georgia", 13));
  intoff = cp1.addTextlabel("Inst_off").setText("* Instituicao").setPosition(350, 55).setColor(0).setFont(createFont("Georgia", 13));
  equipmoff = cp1.addTextlabel("Equip_off").setText("* Equipamento").setPosition(510, 55).setColor(0).setFont(createFont("Georgia", 13));
  snoff = cp1.addTextlabel("Sn_off").setText("* Número de Série").setPosition(670, 55).setColor(0).setFont(createFont("Georgia", 13));
  pendoff = cp1.addTextlabel("Pend_off").setText("* Pendência").setPosition(830, 55).setColor(0).setFont(createFont("Georgia", 13));

  tfID_off1 = cp1.addTextfield("ID_off1").setLabel("").setPosition(40, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  tfCon_off1 = cp1.addTextfield("Con_off1").setLabel("").setPosition(190, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  tfInst_off1 = cp1.addTextfield("Inst_off1").setLabel("").setPosition(350, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  tfEquip_off1 = cp1.addTextfield("Equip_off1").setLabel("").setPosition(510, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  tfSn_off1 = cp1.addTextfield("Sn_off1").setLabel("").setPosition(670, 85).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  tfPend_off1 = cp1.addTextfield("Pend_off1").setLabel("").setPosition(830, 85).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  tfID_off2 = cp1.addTextfield("ID_off2").setLabel("").setPosition(40, 105).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfCon_off2 = cp1.addTextfield("Con_off2").setLabel("").setPosition(190, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfInst_off2 = cp1.addTextfield("Inst_off2").setLabel("").setPosition(350, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfEquip_off2 = cp1.addTextfield("Equip_off2").setLabel("").setPosition(510, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfSn_off2 = cp1.addTextfield("Sn_off2").setLabel("").setPosition(670, 105).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfPend_off2 = cp1.addTextfield("Pend_off2").setLabel("").setPosition(830, 105).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  tfID_off3 = cp1.addTextfield("ID_off3").setLabel("").setPosition(40, 125).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfCon_off3 = cp1.addTextfield("Con_off3").setLabel("").setPosition(190, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfInst_off3 = cp1.addTextfield("Inst_off3").setLabel("").setPosition(350, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfEquip_off3 = cp1.addTextfield("Equip_off3").setLabel("").setPosition(510, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfSn_off3 = cp1.addTextfield("Sn_off3").setLabel("").setPosition(670, 125).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfPend_off3 = cp1.addTextfield("Pend_off3").setLabel("").setPosition(830, 125).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  tfID_off4 = cp1.addTextfield("ID_off4").setLabel("").setPosition(40, 145).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfCon_off4 = cp1.addTextfield("Con_off4").setLabel("").setPosition(190, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfInst_off4 = cp1.addTextfield("Inst_off4").setLabel("").setPosition(350, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfEquip_off4 = cp1.addTextfield("Equip_off4").setLabel("").setPosition(510, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfSn_off4 = cp1.addTextfield("Sn_off4").setLabel("").setPosition(670, 145).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfPend_off4 = cp1.addTextfield("Pend_off4").setLabel("").setPosition(830, 145).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  tfID_off5 = cp1.addTextfield("ID_off5").setLabel("").setPosition(40, 165).setColorCaptionLabel(0).setSize(150, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfCon_off5 = cp1.addTextfield("Con_off5").setLabel("").setPosition(190, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfInst_off5 = cp1.addTextfield("Inst_off5").setLabel("").setPosition(350, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfEquip_off5 = cp1.addTextfield("Equip_off5").setLabel("").setPosition(510, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfSn_off5 = cp1.addTextfield("Sn_off5").setLabel("").setPosition(670, 165).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  tfPend_off5 = cp1.addTextfield("Pend_off5").setLabel("").setPosition(830, 165).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  cp1.addTextlabel("ID_on").setText("* ID").setPosition(40, 325).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Con_on").setText("* Contrato").setPosition(190, 325).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Inst_on").setText("* Instituicao").setPosition(350, 325).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Equip_on").setText("* Equipamento").setPosition(510, 325).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Sn_on").setText("* Número de Série").setPosition(670, 325).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Pend_on").setText("* Pendência").setPosition(830, 325).setColor(0).setFont(createFont("Georgia", 13));

  cp1.addTextfield("ID_on1").setLabel("").setPosition(40, 355).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cp1.addTextfield("Con_on1").setLabel("").setPosition(190, 355).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cp1.addTextfield("Inst_on1").setLabel("").setPosition(350, 355).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cp1.addTextfield("Equip_on1").setLabel("").setPosition(510, 355).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cp1.addTextfield("Sn_on1").setLabel("").setPosition(670, 355).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);
  cp1.addTextfield("Pend_on1").setLabel("").setPosition(830, 355).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0);

  cp1.addTextfield("ID_on2").setLabel("").setPosition(40, 375).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Con_on2").setLabel("").setPosition(190, 375).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Inst_on2").setLabel("").setPosition(350, 375).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Equip_on2").setLabel("").setPosition(510, 375).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Sn_on2").setLabel("").setPosition(670, 375).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Pend_on2").setLabel("").setPosition(830, 375).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  cp1.addTextfield("ID_on3").setLabel("").setPosition(40, 395).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Con_on3").setLabel("").setPosition(190, 395).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Inst_on3").setLabel("").setPosition(350, 395).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Equip_on3").setLabel("").setPosition(510, 395).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Sn_on3").setLabel("").setPosition(670, 395).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Pend_on3").setLabel("").setPosition(830, 395).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  cp1.addTextfield("ID_on4").setLabel("").setPosition(40, 415).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Con_on4").setLabel("").setPosition(190, 415).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Inst_on4").setLabel("").setPosition(350, 415).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Equip_on4").setLabel("").setPosition(510, 415).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Sn_on4").setLabel("").setPosition(670, 415).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Pend_on4").setLabel("").setPosition(830, 415).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  cp1.addTextfield("ID_on5").setLabel("").setPosition(40, 435).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Con_on5").setLabel("").setPosition(190, 435).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Inst_on5").setLabel("").setPosition(350, 435).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Equip_on5").setLabel("").setPosition(510, 435).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Sn_on5").setLabel("").setPosition(670, 435).setColorCaptionLabel(0).setSize(160, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();
  cp1.addTextfield("Pend_on5").setLabel("").setPosition(830, 435).setColorCaptionLabel(0).setSize(130, 20).setAutoClear(false).setColorBackground(0xffffffff).setColor(40).setColorForeground(0).setFont(createFont("Georgia", 12)).updateSize().setColorActive(0x00000000).setColorCursor(0).hide();

  relat = new GTextArea(this, 30, 320, 940, 190, G4P.SCROLLBARS_BOTH | G4P.SCROLLBARS_AUTOHIDE);
  relat.setPromptText("Use Ctrl + C para copiar texto, ou use Ctrl + V para colar texto.");
  relat.setOpaque(false);
  relat.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  relat.setTextEditEnabled(true);
  relat.setVisible(false);

  historico = new GTextArea(this, 30, 320, 940, 190, G4P.SCROLLBARS_BOTH | G4P.SCROLLBARS_AUTOHIDE);
  historico.setPromptText("Use Ctrl + C para copiar texto, ou use Ctrl + V para colar texto.");
  historico.setOpaque(false);
  historico.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  historico.setTextEditEnabled(true);
  historico.setVisible(false);

  estado = cp1.addScrollableList("Estado").setLabel("Estado/Província").setPosition(550, 150).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(200, 80).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  pais = cp1.addScrollableList("País").setLabel("País").setPosition(760, 150).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(210, 80).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);

  marca = cp1.addScrollableList("Marca").setLabel("Marca").setPosition(30, 320).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(150, 150).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  classe = cp1.addScrollableList("Classe").setLabel("Classe").setPosition(190, 320).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(150, 150).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  equipamento = cp1.addScrollableList("Equipamento").setLabel("Equipamento").setPosition(350, 320).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(150, 150).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  modelo = cp1.addScrollableList("Modelo").setLabel("Modelo").setPosition(510, 320).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(150, 150).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  cp1.addTextlabel("Sn_total").setText("* Número de série").setPosition(670, 320).setColor(0).setFont(createFont("Georgia", 13));
  cp1.addTextlabel("Versao_total").setText("* Versão").setPosition(830, 320).setColor(0).setFont(createFont("Georgia", 13));

  instituicao = cp1.addScrollableList("Instituicao").setLabel("Instituicao").setPosition(30, 60).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(300, 170).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  instituto = cp1.addScrollableList("Instituto").setLabel("Instituto").setPosition(340, 60).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(200, 17).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  departamento = cp1.addScrollableList("Departamento").setLabel("Departamento").setPosition(550, 60).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(200, 170).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  laboratório = cp1.addScrollableList("Laboratório").setLabel("Laboratório").setPosition(760, 60).setBarHeight(20).setColorCaptionLabel(0).setSize(210, 170).setItemHeight(20).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);

  cp1.addButton("Novo")
    .setPosition(680, 5)
    .setImages(novo).updateSize()
    .updateSize();

  cp1.addButton("Abrir")
    .setPosition(720, 5)
    .setImages(abrir).updateSize()
    .updateSize();

  cp1.addButton("Copiar")
    .setPosition(760, 5)
    .setImages(copiar).updateSize()
    .updateSize();

  cp1.addButton("Colar")
    .setPosition(800, 5)
    .setImages(colar).updateSize()
    .updateSize();

  cp1.addButton("Arquivar")
    .setPosition(840, 5)
    .setImages(arquivar).updateSize()
    .updateSize();

  cp1.addButton("Assinar")
    .setPosition(880, 5)
    .setImages(assinar).updateSize()
    .updateSize();

  cp1.addButton("PDF")
    .setPosition(920, 5)
    .setImages(pdf).updateSize()
    .updateSize();

  cp1.addButton("Salvar")
    .setPosition(960, 5)
    .setImages(salvar).updateSize()
    .updateSize();

  cp1.addButton("Adicionar")
    .setPosition(60, 488)
    .setImages(Adicionar).updateSize()
    .updateSize();

  cp1.addButton("Remover")
    .setPosition(100, 488)
    .setImages(Retirar).updateSize()
    .updateSize();

  cp1.addButton("Incluir")
    .setPosition(60, 215)
    .setImages(Adicionar).updateSize()
    .updateSize();

  cp1.addButton("Retirar")
    .setPosition(100, 215)
    .setImages(Retirar).updateSize()
    .updateSize();

  tipo = cp1.addScrollableList("Tipo").setLabel("Tipo").setPosition(140, 555).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(50, 40).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);
  servico = cp1.addScrollableList("Servico").setLabel("Servico").setPosition(200, 555).setBarHeight(20).setItemHeight(20).setColorCaptionLabel(0).setSize(100, 40).setColorBackground(0xffffffff).setColorForeground(#E3DEDE).setFont(createFont("Georgia", 12)).updateSize().setColorActive(#E3DEDE).setType(ScrollableList.LIST).setOpen(false);

  cp1.getController("Cliente").moveTo("default");
  cp1.getController("Equipamento").moveTo("default");
  cp1.getController("Cronograma").moveTo("Laudo");
  cp1.getController("Relatorio").moveTo("Laudo");
  cp1.getController("Suprimentos").moveTo("Itens");
  cp1.getController("Histo").moveTo("Itens");
  cp1.getController("Offline").moveTo("Base de Dados");
  cp1.getController("Online").moveTo("Base de Dados");

  cp1.getController("Data").moveTo("Laudo");
  cp1.getController("DeslT").moveTo("Laudo");
  cp1.getController("DeslA").moveTo("Laudo");
  cp1.getController("HorT").moveTo("Laudo");
  cp1.getController("Diver").moveTo("Laudo");
  cp1.getController("Total").moveTo("Laudo");
  cp1.getController("Incluir").moveTo("Laudo");
  cp1.getController("Retirar").moveTo("Laudo");

  cp1.getController("Data1").moveTo("Laudo");
  cp1.getController("DeslT1").moveTo("Laudo");
  cp1.getController("DeslA1").moveTo("Laudo");
  cp1.getController("HorT1").moveTo("Laudo");
  cp1.getController("Diver1").moveTo("Laudo");
  cp1.getController("Total1").moveTo("Laudo");

  cp1.getController("Data2").moveTo("Laudo");
  cp1.getController("DeslT2").moveTo("Laudo");
  cp1.getController("DeslA2").moveTo("Laudo");
  cp1.getController("HorT2").moveTo("Laudo");
  cp1.getController("Diver2").moveTo("Laudo");
  cp1.getController("Total2").moveTo("Laudo");

  cp1.getController("Data3").moveTo("Laudo");
  cp1.getController("DeslT3").moveTo("Laudo");
  cp1.getController("DeslA3").moveTo("Laudo");
  cp1.getController("HorT3").moveTo("Laudo");
  cp1.getController("Diver3").moveTo("Laudo");
  cp1.getController("Total3").moveTo("Laudo");

  cp1.getController("Data4").moveTo("Laudo");
  cp1.getController("DeslT4").moveTo("Laudo");
  cp1.getController("DeslA4").moveTo("Laudo");
  cp1.getController("HorT4").moveTo("Laudo");
  cp1.getController("Diver4").moveTo("Laudo");
  cp1.getController("Total4").moveTo("Laudo");

  cp1.getController("Data5").moveTo("Laudo");
  cp1.getController("DeslT5").moveTo("Laudo");
  cp1.getController("DeslA5").moveTo("Laudo");
  cp1.getController("HorT5").moveTo("Laudo");
  cp1.getController("Diver5").moveTo("Laudo");
  cp1.getController("Total5").moveTo("Laudo");

  cp1.getController("Pedido").moveTo("Itens");
  cp1.getController("ContrPc").moveTo("Itens");
  cp1.getController("Item").moveTo("Itens");
  cp1.getController("Descr").moveTo("Itens");
  cp1.getController("Quantid").moveTo("Itens");
  cp1.getController("Detalhe").moveTo("Itens");

  cp1.getController("Pedido1").moveTo("Itens");
  cp1.getController("ContrPc1").moveTo("Itens");
  cp1.getController("Item1").moveTo("Itens");
  cp1.getController("Descr1").moveTo("Itens");
  cp1.getController("Quantid1").moveTo("Itens");
  cp1.getController("Detalhe1").moveTo("Itens");

  cp1.getController("Pedido2").moveTo("Itens");
  cp1.getController("ContrPc2").moveTo("Itens");
  cp1.getController("Item2").moveTo("Itens");
  cp1.getController("Descr2").moveTo("Itens");
  cp1.getController("Quantid2").moveTo("Itens");
  cp1.getController("Detalhe2").moveTo("Itens");

  cp1.getController("Pedido3").moveTo("Itens");
  cp1.getController("ContrPc3").moveTo("Itens");
  cp1.getController("Item3").moveTo("Itens");
  cp1.getController("Descr3").moveTo("Itens");
  cp1.getController("Quantid3").moveTo("Itens");
  cp1.getController("Detalhe3").moveTo("Itens");

  cp1.getController("Pedido4").moveTo("Itens");
  cp1.getController("ContrPc4").moveTo("Itens");
  cp1.getController("Item4").moveTo("Itens");
  cp1.getController("Descr4").moveTo("Itens");
  cp1.getController("Quantid4").moveTo("Itens");
  cp1.getController("Detalhe4").moveTo("Itens");

  cp1.getController("Pedido5").moveTo("Itens");
  cp1.getController("ContrPc5").moveTo("Itens");
  cp1.getController("Item5").moveTo("Itens");
  cp1.getController("Descr5").moveTo("Itens");
  cp1.getController("Quantid5").moveTo("Itens");
  cp1.getController("Detalhe5").moveTo("Itens");

  cp1.getController("ID_off").moveTo("Base de Dados");
  cp1.getController("Con_off").moveTo("Base de Dados");
  cp1.getController("Inst_off").moveTo("Base de Dados");
  cp1.getController("Equip_off").moveTo("Base de Dados");
  cp1.getController("Sn_off").moveTo("Base de Dados");
  cp1.getController("Pend_off").moveTo("Base de Dados");

  cp1.getController("ID_off1").moveTo("Base de Dados");
  cp1.getController("Con_off1").moveTo("Base de Dados");
  cp1.getController("Inst_off1").moveTo("Base de Dados");
  cp1.getController("Equip_off1").moveTo("Base de Dados");
  cp1.getController("Sn_off1").moveTo("Base de Dados");
  cp1.getController("Pend_off1").moveTo("Base de Dados");

  cp1.getController("ID_off2").moveTo("Base de Dados");
  cp1.getController("Con_off2").moveTo("Base de Dados");
  cp1.getController("Inst_off2").moveTo("Base de Dados");
  cp1.getController("Equip_off2").moveTo("Base de Dados");
  cp1.getController("Sn_off2").moveTo("Base de Dados");
  cp1.getController("Pend_off2").moveTo("Base de Dados");

  cp1.getController("ID_off3").moveTo("Base de Dados");
  cp1.getController("Con_off3").moveTo("Base de Dados");
  cp1.getController("Inst_off3").moveTo("Base de Dados");
  cp1.getController("Equip_off3").moveTo("Base de Dados");
  cp1.getController("Sn_off3").moveTo("Base de Dados");
  cp1.getController("Pend_off3").moveTo("Base de Dados");

  cp1.getController("ID_off4").moveTo("Base de Dados");
  cp1.getController("Con_off4").moveTo("Base de Dados");
  cp1.getController("Inst_off4").moveTo("Base de Dados");
  cp1.getController("Equip_off4").moveTo("Base de Dados");
  cp1.getController("Sn_off4").moveTo("Base de Dados");
  cp1.getController("Pend_off4").moveTo("Base de Dados");

  cp1.getController("ID_off5").moveTo("Base de Dados");
  cp1.getController("Con_off5").moveTo("Base de Dados");
  cp1.getController("Inst_off5").moveTo("Base de Dados");
  cp1.getController("Equip_off5").moveTo("Base de Dados");
  cp1.getController("Sn_off5").moveTo("Base de Dados");
  cp1.getController("Pend_off5").moveTo("Base de Dados");

  cp1.getController("ID_on").moveTo("Base de Dados");
  cp1.getController("Con_on").moveTo("Base de Dados");
  cp1.getController("Inst_on").moveTo("Base de Dados");
  cp1.getController("Equip_on").moveTo("Base de Dados");
  cp1.getController("Sn_on").moveTo("Base de Dados");
  cp1.getController("Pend_on").moveTo("Base de Dados");

  cp1.getController("ID_on1").moveTo("Base de Dados");
  cp1.getController("Con_on1").moveTo("Base de Dados");
  cp1.getController("Inst_on1").moveTo("Base de Dados");
  cp1.getController("Equip_on1").moveTo("Base de Dados");
  cp1.getController("Sn_on1").moveTo("Base de Dados");
  cp1.getController("Pend_on1").moveTo("Base de Dados");

  cp1.getController("ID_on2").moveTo("Base de Dados");
  cp1.getController("Con_on2").moveTo("Base de Dados");
  cp1.getController("Inst_on2").moveTo("Base de Dados");
  cp1.getController("Equip_on2").moveTo("Base de Dados");
  cp1.getController("Sn_on2").moveTo("Base de Dados");
  cp1.getController("Pend_on2").moveTo("Base de Dados");

  cp1.getController("ID_on3").moveTo("Base de Dados");
  cp1.getController("Con_on3").moveTo("Base de Dados");
  cp1.getController("Inst_on3").moveTo("Base de Dados");
  cp1.getController("Equip_on3").moveTo("Base de Dados");
  cp1.getController("Sn_on3").moveTo("Base de Dados");
  cp1.getController("Pend_on3").moveTo("Base de Dados");

  cp1.getController("ID_on4").moveTo("Base de Dados");
  cp1.getController("Con_on4").moveTo("Base de Dados");
  cp1.getController("Inst_on4").moveTo("Base de Dados");
  cp1.getController("Equip_on4").moveTo("Base de Dados");
  cp1.getController("Sn_on4").moveTo("Base de Dados");
  cp1.getController("Pend_on4").moveTo("Base de Dados");

  cp1.getController("ID_on5").moveTo("Base de Dados");
  cp1.getController("Con_on5").moveTo("Base de Dados");
  cp1.getController("Inst_on5").moveTo("Base de Dados");
  cp1.getController("Equip_on5").moveTo("Base de Dados");
  cp1.getController("Sn_on5").moveTo("Base de Dados");
  cp1.getController("Pend_on5").moveTo("Base de Dados");

  cp1.getController("Novo").moveTo("global");
  cp1.getController("Abrir").moveTo("global");
  cp1.getController("Copiar").moveTo("global");
  cp1.getController("Colar").moveTo("global");
  cp1.getController("Arquivar").moveTo("global");
  cp1.getController("Assinar").moveTo("global");
  cp1.getController("PDF").moveTo("global");
  cp1.getController("Salvar").moveTo("global");

  id.moveTo("global");
  tipo.moveTo("global");
  servico.moveTo("global");
  chamado.moveTo("global");
  contrato.moveTo("global");
  contato.moveTo("global");
  responsavel.moveTo("global");

  for (int i=0; i<5; i++) {
    tipo.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    servico.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    instituicao.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    instituto.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    departamento.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    laboratório.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    estado.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    pais.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    marca.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    classe.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    equipamento.addItem("item " + i, i);
  }

  for (int i=0; i<5; i++) {
    modelo.addItem("item " + i, i);
  }

  setupDatabase();
}

void draw() {

  java.awt.Frame winmain = (java.awt.Frame) ((processing.awt.PSurfaceAWT.SmoothCanvas) surface.getNative()).getFrame();
  primaryX = winmain.getX();
  primaryY = winmain.getY();

  surface.setTitle(window1);

  background(210);

  fill(225);
  rect(width/2 + 160, 0, width/2 + 45, 28, 5);

  Drawcontourx(5, 30, 990, 250);
  Drawcontourx(5, 300, 990, 250);

  switch(activeTab) {

  case 0:

    relat.setVisible(false);
    historico.setVisible(false);
    Drawcontour(15, 40, 970, 210);
    Drawcontour(15, 310, 970, 210);
    fill(245);
    rect(25, 345, 950, 130, 0);
    rect(50, 482, 80, 30, 0);
    break;

  case 1:

    historico.setVisible(false);
    Drawcontour(15, 40, 970, 210);
    fill(245);
    rect(25, 50, 950, 150, 0);
    rect(30, 75, 940, 120, 0);
    rect(50, 209, 80, 30, 0);
    Drawcontour(15, 310, 970, 210);
    relat.setVisible(true);
    cp1.getController("Incluir").moveTo("Laudo");
    cp1.getController("Retirar").moveTo("Laudo");
    break;

  case 2:

    relat.setVisible(false);
    Drawcontour(15, 40, 970, 210);
    fill(245);
    rect(25, 50, 950, 150, 0);
    rect(30, 75, 940, 120, 0);
    rect(50, 209, 80, 30, 0);
    Drawcontour(15, 310, 970, 210);
    historico.setVisible(true);
    cp1.getController("Incluir").moveTo("Itens");
    cp1.getController("Retirar").moveTo("Itens");
    break;

  case 3:

    relat.setVisible(false);
    historico.setVisible(false);
    Drawcontour(15, 40, 970, 210);
    fill(245);
    rect(25, 50, 950, 150, 0);
    rect(30, 75, 940, 120, 0);
    Drawcontour(15, 310, 970, 210);
    fill(245);
    rect(25, 320, 950, 150, 0);
    rect(30, 345, 940, 120, 0);
    break;
  }
}

void exit() {
  closeConnection();
  super.exit();
}
