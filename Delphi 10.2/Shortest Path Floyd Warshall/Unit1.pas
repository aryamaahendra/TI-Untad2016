unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Image1: TImage;
    sNodeTamanRia: TShape;
    sNodeRumahAdatSouraja: TShape;
    sNodeGongPerdamaian: TShape;
    sNodeWisataSateMobil: TShape;
    sNodeAirTerjunWombo: TShape;
    sNodeJembatanKuning: TShape;
    sNodeTanggulNosarara: TShape;
    sNodeMatantimali: TShape;
    sNodePantaiTalise: TShape;
    sNodeAnjungan: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lAC: TLabel;
    lAB: TLabel;
    Label13: TLabel;
    lBC: TLabel;
    lBD: TLabel;
    LCE: TLabel;
    lBF: TLabel;
    lBE: TLabel;
    lDG: TLabel;
    lEH: TLabel;
    lEF: TLabel;
    lFG: TLabel;
    lFH: TLabel;
    lFJ: TLabel;
    lHJ: TLabel;
    lIJ: TLabel;
    lFI: TLabel;
    lGI: TLabel;
    lDF: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure sambungkanNode;
    procedure matrixAdje;
    procedure DrawLine(a, b:TPoint; cl:TColor);// PRocedure Untuk membuat garis
    procedure drawPath(temp: string; c:TColor);
  end;

var
  Form1: TForm1;

implementation

const n = 10;// inilialisasi banyaknya node

type
  Tmatrix = array[0..n-1] of array[0..n-1] of Integer;

var
  inf: Integer = 999;// Nilai Infinity / Tak Terbatas
  curNodeA, curNodeB: TShape;
  shortLine: string;
  matrix, sebelum: Tmatrix;
  proses: BOOL;
  node: array[0..n-1] of string;

{$R *.dfm}

procedure floydSearch(var jarak, sbm: Tmatrix);
var
  i, j, k, con:Integer;
begin
  for i := 0 to n-1 do
  begin
    for j := 0 to n-1 do
    begin
      if i = j then
        sbm[i][j] := -1
      else
        sbm[i][j] := j;
    end;
  end;

  for k := 0 to n-1 do
  begin
    for i := 0 to n-1 do
    begin
        for j := 0 to n-1 do
        begin
          if (k<>j) and (k<>i) and (i<>j) then
          begin
            if jarak[i][j] >= jarak[i][k]+jarak[k][j] then
            begin
              jarak[i][j] := jarak[i][k]+jarak[k][j];
              sbm[i][j] := k;
            end;
          end;
        end;
    end;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i, j, Awal, Akhir,trak: Integer;
  temp2, jarak: string;
begin
  if shortLine <> '' then
    drawPath(shortLine, clBlack);
  if not proses then
  begin
    floydSearch(matrix, sebelum);
    proses := True;
  end;
  shortLine := '';
  if (ComboBox1.Text <> '') and (ComboBox2.Text <>'') then
  begin
    // Step Mencari Titik Awal dan mencari titik awal dgn cara menyamakan
    // combobox1 dgn salah satu nilai index pada node jika sama makan indexnya akan
    // disimpan sebagai titik awal.
    for i := 0 to n-1 do
      if ComboBox1.Text = node[i] then
        Awal := i
      else if ComboBox2.Text = node[i] then
        Akhir := i;
    trak := Akhir;
    shortLine := IntToStr(Akhir);
    for i := 0 to n-1 do
    begin
      if trak <> sebelum[Awal][trak] then
      begin
        shortLine := shortLine + IntToStr(sebelum[Awal][trak]);
        trak := sebelum[Awal][trak];
      end
      else
        break;
    end;
    shortLine := shortLine + IntToStr(Awal);
    temp2 := node[Awal];
    for i := Length(shortLine)-1 downto 1 do
      temp2 := temp2 +'->'+node[StrToInt(shortLine[i])];
    Memo1.Lines.Append('Jalur : '+temp2);
    Memo1.Lines.Append('Jarak : '+IntToStr(matrix[Awal][Akhir]));
    drawPath(shortLine, clRed);
  end;

//    for i := 0 to Length(matrix)-1 do
//    begin
//      temp := '';
//      for j := 0 to Length(matrix)-1 do
//        begin
//          temp := temp + ' '+ IntToStr(matrix[i][j]);
//        end;
//      Memo1.Lines.Append(temp);
//    end;
//
//    for i := 0 to Length(sebelum)-1 do
//    begin
//      temp := '';
//      for j := 0 to Length(sebelum)-1 do
//        begin
//          temp := temp + ' ' + IntToStr(sebelum[i][j]);
//        end;
//      Memo1.Lines.Append(temp);
//    end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  drawPath(shortLine, clBlack);
  Memo1.Lines.Clear;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  i: Integer;
  node: TShape;
  temp: string;
begin
  temp := StringReplace(ComboBox1.Text, ' ', '', [rfReplaceAll]);
  // Menambahkan Item Pada ComboBox2/combobox Titik Tujuan dengan node yang ada
  // Kecuali Node Yang Terlah Dipilih Sebagai node awal
  ComboBox2.Items.Clear;
  for i := 0 to ComboBox1.Items.Count-1 do
    if ComboBox1.ItemIndex <> i then
      ComboBox2.Items.Append(ComboBox1.Items[i]);

  // Mencari Node Yang Telah Dipilih kemudian mengubah warnanya menjadi merah
  // kemudian menyimpan node yang telah di rubah warnanya agar dapat di rubah kembali
  // warnanya jika titik awak node di ubah
  node := TShape(FindComponent('sNode'+temp));
  node.Brush.Color := clRed;

  if curNodeA <> nil then  // Mengecek Apakah Node sebelumnya suda ada atau blm
    curNodeA.Brush.Color := clBlack; //jika ada maka akan diubah warnanya ke hitam
  curNodeA := node;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
var
  node: TShape;
  temp: string;
begin
  temp := StringReplace(ComboBox2.Text, ' ', '', [rfReplaceAll]);
  node:=TShape(FindComponent('sNode'+temp));
  node.Brush.Color := clRed;
  if curNodeB <> nil then  // Mengecek Apakah Node sebelumnya suda ada atau blm
    curNodeB.Brush.Color := clBlack; //jika ada maka akan diubah warnanya ke hitam
  curNodeB := node;
end;

procedure TForm1.DrawLine(a, b: TPoint; cl: TColor);
begin
  with Image1.Canvas do
  begin
    Pen.Mode := pmCopy;
    Pen.Color := cl;
    MoveTo(a.X, a.Y);
    LineTo(b.X, b.Y);
  end;
end;

procedure TForm1.drawPath(temp: string; c: TColor);
var
  i: integer;
  node1, node2: TShape;
  a, b:TPoint;
  temp1, temp2: string;
begin
  for i := Length(temp) downto 2 do
    begin
      temp1 := StringReplace(node[StrToInt(temp[i])], ' ', '', [rfReplaceAll]);
      temp2 := StringReplace(node[StrToInt(temp[i-1])], ' ', '', [rfReplaceAll]);
      node1 := TShape(FindComponent('sNode'+temp1));
      node2 := TShape(FindComponent('sNode'+temp2));
      a.X := node1.Left+(node1.Width div 2);
      a.Y := node1.Top+(node1.Height div 2);
      b.X := node2.Left+(node2.Width div 2);
      b.Y := node2.Top+(node2.Height div 2);
      DrawLine(a, b, c);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  sambungkanNode;
  matrixAdje;
  proses := False;
  for i := 0 to n-1 do
    node[i] := ComboBox1.Items[i];
end;

procedure TForm1.matrixAdje;//Procedure Mengisikan Nilai setiap Edge ke Dalam Matrix
begin
  matrix[0][0] := 0;
  matrix[0][1] := 10;
  matrix[0][2] := 15;
  matrix[0][3] := 8;
  matrix[0][4] := inf;
  matrix[0][5] := inf;
  matrix[0][6] := inf;
  matrix[0][7] := inf;
  matrix[0][8] := inf;
  matrix[0][9] := inf;

  matrix[1][0] := 10;
  matrix[1][1] := 0;
  matrix[1][2] := 18;
  matrix[1][3] := 7;
  matrix[1][4] := 21;
  matrix[1][5] := 15;
  matrix[1][6] := inf;
  matrix[1][7] := inf;
  matrix[1][8] := inf;
  matrix[1][9] := inf;

  matrix[2][0] := 15;
  matrix[2][1] := 18;
  matrix[2][2] := 0;
  matrix[2][3] := inf;
  matrix[2][4] := 20;
  matrix[2][5] := inf;
  matrix[2][6] := inf;
  matrix[2][7] := inf;
  matrix[2][8] := inf;
  matrix[2][9] := inf;

  matrix[3][0] := 8;
  matrix[3][1] := 7;
  matrix[3][2] := inf;
  matrix[3][3] := 0;
  matrix[3][4] := inf;
  matrix[3][5] := 11;
  matrix[3][6] := 18;
  matrix[3][7] := inf;
  matrix[3][8] := inf;
  matrix[3][9] := inf;

  matrix[4][0] := inf;
  matrix[4][1] := 21;
  matrix[4][2] := 20;
  matrix[4][3] := inf;
  matrix[4][4] := 0;
  matrix[4][5] := 12;
  matrix[4][6] := inf;
  matrix[4][7] := 15;
  matrix[4][8] := inf;
  matrix[4][9] := inf;

  matrix[5][0] := inf;
  matrix[5][1] := 15;
  matrix[5][2] := inf;
  matrix[5][3] := 11;
  matrix[5][4] := 12;
  matrix[5][5] := 0;
  matrix[5][6] := 9;
  matrix[5][7] := 23;
  matrix[5][8] := 17;
  matrix[5][9] := 28;

  matrix[6][0] := inf;
  matrix[6][1] := inf;
  matrix[6][2] := inf;
  matrix[6][3] := 18;
  matrix[6][4] := inf;
  matrix[6][5] := 9;
  matrix[6][6] := 0;
  matrix[6][7] := inf;
  matrix[6][8] := 10;
  matrix[6][9] := inf;

  matrix[7][0] := inf;
  matrix[7][1] := inf;
  matrix[7][2] := inf;
  matrix[7][3] := inf;
  matrix[7][4] := 15;
  matrix[7][5] := 23;
  matrix[7][6] := inf;
  matrix[7][7] := 0;
  matrix[7][8] := inf;
  matrix[7][9] := 8;

  matrix[8][0] := inf;
  matrix[8][1] := inf;
  matrix[8][2] := inf;
  matrix[8][3] := inf;
  matrix[8][4] := inf;
  matrix[8][5] := 17;
  matrix[8][6] := 10;
  matrix[8][7] := inf;
  matrix[8][8] := 0;
  matrix[8][9] := 5;

  matrix[9][0] := inf;
  matrix[9][1] := inf;
  matrix[9][2] := inf;
  matrix[9][3] := inf;
  matrix[9][4] := inf;
  matrix[9][5] := 28;
  matrix[9][6] := inf;
  matrix[9][7] := 8;
  matrix[9][8] := 5;
  matrix[9][9] := 0;
end;

procedure TForm1.sambungkanNode;
begin
  with Image1.Canvas do
  begin
    Pen.Mode := pmCopy;
    Pen.Color := clBlack; // Mengubah Warna garis menjadi Hitam
    Pen.Width := 3;

    // Untuk Mencari Titik Koordinat Dari Setiap node didapatkan dari
    // perhitungan titik X = Left+(Lebar/2), titik Y = Top+(Tinggi/2) rumus ini
    // Mengikuti Anchors dari properti node akLeft, akTop.
    MoveTo(sNodeAnjungan.Left+(sNodeAnjungan.Width div 2), sNodeAnjungan.Top+(sNodeAnjungan.Height div 2)); // Memulai Garis Dari Node A
    LineTo(sNodeTamanRia.Left+(sNodeTamanRia.Width div 2), sNodeTamanRia.Top+(sNodeTamanRia.Height div 2)); // Membuat Garis Ke Node B

    // Membuat Garis Dari A ke C
    MoveTo(sNodeAnjungan.Left+(sNodeAnjungan.Width div 2), sNodeAnjungan.Top+(sNodeAnjungan.Height div 2));
    LineTo(sNodeRumahAdatSouraja.Left+(sNodeRumahAdatSouraja.Width div 2), sNodeRumahAdatSouraja.Top+(sNodeRumahAdatSouraja.Height div 2));

    // Membuat Garis Dari A ke D
    MoveTo(sNodeAnjungan.Left+(sNodeAnjungan.Width div 2), sNodeAnjungan.Top+(sNodeAnjungan.Height div 2));
    LineTo(sNodeJembatanKuning.Left+(sNodeJembatanKuning.Width div 2), sNodeJembatanKuning.Top+(sNodeJembatanKuning.Height div 2));

    // Membuat Garis Dari B ke C
    MoveTo(sNodeTamanRia.Left+(sNodeTamanRia.Width div 2), sNodeTamanRia.Top+(sNodeTamanRia.Height div 2));
    LineTo(sNodeRumahAdatSouraja.Left+(sNodeRumahAdatSouraja.Width div 2), sNodeRumahAdatSouraja.Top+(sNodeRumahAdatSouraja.Height div 2));

    // Membuat Garis Dari B ke D
    MoveTo(sNodeTamanRia.Left+(sNodeTamanRia.Width div 2), sNodeTamanRia.Top+(sNodeTamanRia.Height div 2));
    LineTo(sNodeJembatanKuning.Left+(sNodeJembatanKuning.Width div 2), sNodeJembatanKuning.Top+(sNodeJembatanKuning.Height div 2));

    // Membuat Garis Dari C ke E
    MoveTo(sNodeRumahAdatSouraja.Left+(sNodeRumahAdatSouraja.Width div 2), sNodeRumahAdatSouraja.Top+(sNodeRumahAdatSouraja.Height div 2));
    LineTo(sNodeGongPerdamaian.Left+(sNodeGongPerdamaian.Width div 2), sNodeGongPerdamaian.Top+(sNodeGongPerdamaian.Height div 2));

    // Membuat Garis Dari B ke E
    MoveTo(sNodeTamanRia.Left+(sNodeTamanRia.Width div 2), sNodeTamanRia.Top+(sNodeTamanRia.Height div 2));
    LineTo(sNodeGongPerdamaian.Left+(sNodeGongPerdamaian.Width div 2), sNodeGongPerdamaian.Top+(sNodeGongPerdamaian.Height div 2));

    // Membuat Garis Dari B ke F
    MoveTo(sNodeTamanRia.Left+(sNodeTamanRia.Width div 2), sNodeTamanRia.Top+(sNodeTamanRia.Height div 2));
    LineTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));

    // Membuat Garis Dari D ke F
    MoveTo(sNodeJembatanKuning.Left+(sNodeJembatanKuning.Width div 2), sNodeJembatanKuning.Top+(sNodeJembatanKuning.Height div 2));
    LineTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));

    // Membuat Garis Dari D ke G
    MoveTo(sNodeJembatanKuning.Left+(sNodeJembatanKuning.Width div 2), sNodeJembatanKuning.Top+(sNodeJembatanKuning.Height div 2));
    LineTo(sNodePantaiTalise.Left+(sNodePantaiTalise.Width div 2), sNodePantaiTalise.Top+(sNodePantaiTalise.Height div 2));

     // Membuat Garis Dari F ke E
    MoveTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));
    LineTo(sNodeGongPerdamaian.Left+(sNodeGongPerdamaian.Width div 2), sNodeGongPerdamaian.Top+(sNodeGongPerdamaian.Height div 2));

    // Membuat Garis Dari F ke G
    MoveTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));
    LineTo(sNodePantaiTalise.Left+(sNodePantaiTalise.Width div 2), sNodePantaiTalise.Top+(sNodePantaiTalise.Height div 2));

     // Membuat Garis Dari H ke E
    MoveTo(sNodeAirTerjunWombo.Left+(sNodeAirTerjunWombo.Width div 2), sNodeAirTerjunWombo.Top+(sNodeAirTerjunWombo.Height div 2));
    LineTo(sNodeGongPerdamaian.Left+(sNodeGongPerdamaian.Width div 2), sNodeGongPerdamaian.Top+(sNodeGongPerdamaian.Height div 2));

    // Membuat Garis Dari F ke H
    MoveTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));
    LineTo(sNodeAirTerjunWombo.Left+(sNodeAirTerjunWombo.Width div 2), sNodeAirTerjunWombo.Top+(sNodeAirTerjunWombo.Height div 2));

    // Membuat Garis Dari F ke J
    MoveTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));
    LineTo(sNodeMatantimali.Left+(sNodeMatantimali.Width div 2), sNodeMatantimali.Top+(sNodeMatantimali.Height div 2));

    // Membuat Garis Dari F ke I
    MoveTo(sNodeWisataSateMobil.Left+(sNodeWisataSateMobil.Width div 2), sNodeWisataSateMobil.Top+(sNodeWisataSateMobil.Height div 2));
    LineTo(sNodeTanggulNosarara.Left+(sNodeTanggulNosarara.Width div 2), sNodeTanggulNosarara.Top+(sNodeTanggulNosarara.Height div 2));

    // Membuat Garis Dari G ke I
    MoveTo(sNodePantaiTalise.Left+(sNodePantaiTalise.Width div 2), sNodePantaiTalise.Top+(sNodePantaiTalise.Height div 2));
    LineTo(sNodeTanggulNosarara.Left+(sNodeTanggulNosarara.Width div 2), sNodeTanggulNosarara.Top+(sNodeTanggulNosarara.Height div 2));

    // Membuat Garis Dari H ke J
    MoveTo(sNodeAirTerjunWombo.Left+(sNodeAirTerjunWombo.Width div 2), sNodeAirTerjunWombo.Top+(sNodeAirTerjunWombo.Height div 2));
    LineTo(sNodeMatantimali.Left+(sNodeMatantimali.Width div 2), sNodeMatantimali.Top+(sNodeMatantimali.Height div 2));

    // Membuat Garis Dari I ke J
    MoveTo(sNodeTanggulNosarara.Left+(sNodeTanggulNosarara.Width div 2), sNodeTanggulNosarara.Top+(sNodeTanggulNosarara.Height div 2));
    LineTo(sNodeMatantimali.Left+(sNodeMatantimali.Width div 2), sNodeMatantimali.Top+(sNodeMatantimali.Height div 2));
  end;
end;

end.
