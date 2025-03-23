//public class PWindowl extends PApplet {

//  PWindowl() {
//    super();
//    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
//  }

//  public int ps = 0;

//  public boolean valip = false;
//  public boolean petd = false;
//  public int sertg = 0;
//  public int ift = 0;
//  public String[] p = null;

//  void settings() {
//    smooth(2);
//    size(300, 170);
//  }

//  void setup() {

//    surface.setTitle("Login");
//    surface.setAlwaysOnTop(true);

//    frameRate(10);

//    cp2 = new ControlP5(this);

//    PImage[] Ok = loadImages("/src/ok_a.png", "/src/ok_b.png", "/src/ok_c.png");
//    PImage[] Cancel = loadImages("/src/cancel_a.png", "/src/cancel_b.png", "/src/cancel_c.png");
//    PImage[] Createuser = loadImages("/src/create_a.png", "/src/create_b.png", "/src/create_c.png");
//    PImage[] Deleteuser = loadImages("/src/deleteuser_a.png", "/src/deleteuser_b.png", "/src/deleteuser_c.png");
//    PImage[] Windowslogin = loadImages("/src/windowslogin_a.png", "/src/windowslogin_b.png", "/src/windowslogin_c.png");
//    PImage[] Up = loadImages("/src/up_a.png", "/src/up_b.png", "/src/up_c.png");
//    PImage[] Down = loadImages("/src/down_a.png", "/src/down_b.png", "/src/down_c.png");

//    createuser = cp2.addButton("createuser")
//      .setPosition(75, 85)
//      .setImages(Createuser)
//      .updateSize()
//      .hide();

//    deleteuser = cp2.addButton("deleteuser")
//      .setPosition(201, 85)
//      .setImages(Deleteuser)
//      .updateSize()
//      .hide();

//    downuser = cp2.addButton("downuser")
//      .setPosition(125, 52)
//      .setImages(Down)
//      .updateSize()
//      .hide();

//    upuser = cp2.addButton("upuser")
//      .setPosition(153, 51)
//      .setImages(Up)
//      .updateSize()
//      .hide();

//    cancel = cp2.addButton("cancel")
//      .setPosition(30, 125)
//      .setImages(Cancel)
//      .updateSize();

//    ok = cp2.addButton("ok")
//      .setPosition(166, 125)
//      .setImages(Ok)
//      .updateSize();

//    user = cp2.addTextfield("user")
//      .setPosition(168, 25)
//      .setSize(100, 20)
//      .setFont(createFont("Georgia", 10))
//      .setLabel("")
//      .setColorCaptionLabel(color(40))
//      .setAutoClear(false)
//      .setColorBackground(color(0xffffffff))
//      .setColor(color(0))
//      .setColorForeground(color(0xffffffff))
//      .updateSize()
//      .setColorActive(color(0x00000000))
//      .setColorCursor(color(0))
//      .setFocus(true)
//      .show();

//    password = cp2.addTextfield("password")
//      .setPosition(168, 55)
//      .setSize(100, 20)
//      .setFont(createFont("Georgia", 10))
//      .setLabel("")
//      .setColorCaptionLabel(color(40))
//      .setAutoClear(false)
//      .setColorBackground(color(0xffffffff))
//      .setColor(color(0))
//      .setColorForeground(color(0xffffffff))
//      .updateSize()
//      .setColorActive(color(0x00000000))
//      .setColorCursor(color(0))
//      .setPasswordMode(true)
//      .show();

//    dotb = 1;
//  }

//  void draw() {

//    surface.setTitle(window2);

//    background(170);

//    Drawcontour(5, 5, 290, 160);
//    Drawcontourx(10, 11, 280, 150);

//    Drawcontoury(25, 121, 250, 35);

//    fill(240);
//    textSize(13);
//    text("USERNAME:", 50, 39);

//    if (winlogin != null) {
//      if (cp2 != null) {

//        if (modelogin == false & modemanageruser == 2) {

//          if (ift > properties.length-1) {
//            ift = 0;
//          }

//          if (ift < 0) {
//            ift = properties.length-1;
//          }

//          Drawcontoury(122, 49, 58, 28);
//          p = splitTokens(properties[ift], "#*");
//          derty = p[0];

//          if (derty.equals("pairsecrt")) {
//          } else {
//            user.setText(derty);
//          }
//        } else {
//          textSize(13);
//          text("PASSWORD:", 50, 69);
//        }
//      }
//    }
//    surface.setVisible(login);
//  }

//  void errorx() {

//    if (sertg == 1) {
//      if ( valip == true & petd == false) {

//        Systeminfo = " Wrong password";
//        user.setText("");
//        password.setText("");

//        isTabPressed = false;

//        userid = null;
//        passwordid = null;


//        user.setFocus(true);
//        password.setFocus(false);

//        // oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - Wrong password."+"\r\n";

//        sertg = 0;
//      }
//    }
//  }

//  void upuser() {
//    if (admin == true) {
//      ift--;
//    }
//  }

//  void downuser() {
//    if (admin == true) {
//      ift++;
//    }
//  }

//  public void deleteuser() {

//    upuser.show();
//    downuser.show();
//    password.hide();
//    createuser.show();
//    deleteuser.hide();

//    modelogin = false;
//    modemanageruser = 2;

//    window2 = "Delete user";
//    Systeminfo = "";
//  }

//  void cancel() {

//    if (modelogin == true) {

//    //  if (statusstartrec == true || startcontrol == true || reccontrol == true)
//    //  {
//        Systeminfo = "  Logged in user";
//     // } else {
//       // //  closesec();
//        exit();
//      } else {
//        login = false;
//        Systeminfo = "";
//        user.setText("");
//        password.setText("");
//        userid = null;
//        passwordid = null;
//      }
//    }

//    void createuser() {
//      createusermain();
//    }

//    void ok() {

//      valueps = cp2.get(Textfield.class, "user").getText();
//      userid = "#*" + valueps;

//      ps = cp2.get(Textfield.class, "password").getText().length();
//      passwordid = get_hash(cp2.get(Textfield.class, "password").getText());

//      int id = 0;

//      if ( admin == false ) {
//        modelogin=true;
//      }

//      if (modelogin == false ) {

//        id = userid.length();
//        if (id < 7) {

//          Systeminfo = "         Short ID";

//          user.setFocus(true);
//          password.setFocus(false);
//        } else {
//          if (ps < 5) {

//            Systeminfo = "   Short password";

//            user.setFocus(false);
//            password.setFocus(true);
//          } else {
//            if ((cp2.get(Textfield.class, "password").getText()).equals(valueps)) {

//              Systeminfo = "   Password = ID";

//              user.setFocus(true);
//              password.setFocus(false);
//            } else {
//              idlist.setString(userid, passwordid);
//              String[] p = splitTokens(userid, "#*");
//              properties = (String[]) idlist.keys().toArray(new String[idlist.size()]);

//              user.setText("");
//              password.setText("");
//              userid = null;
//              passwordid = null;
//              ps = 0;
//              valueps = null;

//              // oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - New user created. // User = " + p[0] + "."+"\r\n";

//              Systeminfo = "     User created";

//              burden2 = idlist.toString();
//              users = Steganos.embedText(s0, users, burden2);
//              users.save(topSketchPath+"/lib/idlist.png");

//              user.setFocus(true);
//              password.setFocus(false);
//            }
//          }
//        }
//      }

//      if ( login == true & modelogin == true ) {

//        if (userid == null) {
//          Systeminfo = "   Login with user";

//          user.setText("");
//          password.setText("");
//          userid = null;
//          passwordid = null;
//          ps = 0;
//          valueps = null;
//        }

//        if (idlist.getString(userid) == null) {
//          Systeminfo = "      Invalid User";

//          isTabPressed = false;

//          user.setText("");
//          password.setText("");
//          userid = null;
//          passwordid = null;
//          ps = 0;
//          valueps = null;

//          user.setFocus(true);
//          password.setFocus(false);

//          // oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - Invalid user input."+"\r\n";
//        }

//        int doter = 0;

//        if (idlist.getString(userid) != null) {

//          valip = true;
//          sertg = 1;
//          petd = false;

//          if ((passwordid).equals(idlist.getString(userid))) {
//            petd = true;

//            if (statusstartrec == true || startcontrol == true || reccontrol == true) {

//              String[] p = splitTokens(userid, "#*");

//              if ((p[0]).equals(username)) {
//                String[] l = splitTokens(userid, "#*");
//                username = l[0];

//                if (username.equals("Admin")) {
//                  admin = true;
//                } else {
//                  admin = false;
//                }

//                Systeminfo = "  Login performed";

//                //oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - Login performed. // User = " + username + "."+"\r\n";

//                login = false;
//                modelogin = false;

//                user.setText("");
//                password.setText("");
//                userid = null;
//                passwordid = null;
//                ps = 0;
//                valueps = null;

//                dotb = 1;
//                doter = 1;
//                modevisible0 = 1;
//                modevisible1 = 1;
//                modevisible2 = 1;
//                modevisible3 = 1;
//              } else

//                if (doter == 0) {

//                  // oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - Attempt to login with different user for the open session. // User = " + p[0] + "."+"\r\n";

//                  Systeminfo = "     Different user";

//                  user.setText("");
//                  password.setText("");
//                  userid = null;
//                  passwordid = null;
//                  ps = 0;
//                  valueps = null;
//                }
//            } else {

//              String[] p = splitTokens(userid, "#*");
//              username = p[0];

//              if (username.equals("Admin")) {
//                admin = true;
//              } else {
//                admin = false;
//              }

//              Systeminfo = "  Login performed";

//              //oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - Login performed. // User = " + username + "."+"\r\n";

//              login = false;
//              modelogin = false;

//              user.setText("");
//              password.setText("");
//              userid = null;
//              passwordid = null;
//              ps = 0;
//              valueps = null;

//              dotb = 1;
//              modevisible0 = 1;
//              modevisible1 = 1;
//              modevisible2 = 1;
//              modevisible3 = 1;
//            }
//          }
//        }
//      }

//      if ( modemanageruser == 2 & modelogin == false ) {
//        userid = "#*" + derty;

//        if (idlist.getString(userid) != null) {
//          String[] p = splitTokens(userid, "#*");

//          if ((p[0]).equals("Admin")) {
//            Systeminfo = "Prohibited action";
//            userid = null;
//          } else {
//            idlist.remove(userid);

//            properties = (String[]) idlist.keys().toArray(new String[idlist.size()]);

//            user.setText("");
//            password.setText("");
//            userid = null;
//            passwordid = null;
//            ps = 0;
//            valueps = null;


//            // oldlogs = oldlogs +year()+"/"+month()+"/"+day()+"_"+hour()+":"+minute()+":"+second()+" - Deleted user. // User = " + p[0] + "."+"\r\n";


//            Systeminfo = "      User erased";

//            burden2 = idlist.toString();
//            users = Steganos.embedText(s0, users, burden2);
//            users.save(topSketchPath+"/lib/idlist.png");
//          }
//        }
//      }
//      errorx();
//    }

//    void keyPressed() {
//      if (winlogin != null) {
//        if (cp2 != null) {

//          if (key == CODED) {

//            if (modelogin == false & modemanageruser == 2) {
//              if (keyCode == java.awt.event.KeyEvent.VK_F2) {
//                cp2.getController("createuser").setValue(1);
//              }
//            }

//            if (modelogin == false & modemanageruser == 1) {
//              if (keyCode == java.awt.event.KeyEvent.VK_F2) {
//                cp2.getController("deleteuser").setValue(1);
//              }
//            }

//            if (keyCode == UP || keyCode == RIGHT) {
//              upuser();
//            }
//            if (keyCode == DOWN || keyCode == LEFT) {
//              downuser();
//            }
//          }

//          if (keyCode== TAB) {
//            isTabPressed = !isTabPressed;

//            if (isTabPressed) {
//              user.setFocus(false);
//              password.setFocus(true);
//            } else {
//              user.setFocus(true);
//              password.setFocus(false);
//            }
//          }

//          if (keyCode== ESC) {
//            cancel.setValue(1);
//          }

//          if (keyCode== ENTER) {
//            ok.setValue(1);
//          }
//        }
//      }
//    }

//    String get_hash(String originalpw) {
//      try {
//        MessageDigest md = MessageDigest.getInstance("MD5");
//        md.update(originalpw.getBytes());
//        byte[] digest = md.digest();
//        StringBuilder sb = new StringBuilder(32);
//        for (byte b : digest)   sb.append(String.format("%02x", b & 0xff));
//        return sb.toString();
//      }
//      catch (java.security.NoSuchAlgorithmException e) {
//        return null;
//      }
//    }

//    void DrawTextBoxSTPD( String str, int x, int y, int w, int h)
//    {
//      smooth();
//      //fill(20, 80, 140, 240);
//      rect(x, y, w, h, 20);
//      fill(30);
//      textAlign(LEFT);
//      textSize(10);
//      text(str, x + 40, y + 8, w - 20, h - 10);
//    }


//    void Drawcontour( int x, int y, int w, int h)
//    {
//      fill(205);
//      stroke(30);
//      rect(x, y, w, h, 10);
//    }


//    void Drawcontourx( int x, int y, int w, int h)
//    {
//      fill(130);
//      stroke(230);
//      rect(x, y, w, h, 10);
//    }

//    void Drawcontoury( int x, int y, int w, int h)
//    {
//      fill(220);
//      stroke(255);
//      rect(x, y, w, h, 10);
//    }

//    PApplet parent;

//    void exit() {
//    }
//  }
