object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '::. Created By Snow30k'
  ClientHeight = 432
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Century Gothic'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Knapseck with Branch And Bound  Algorithm'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Century Gothic'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 200
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 493
    Height = 391
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 547
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 246
      Height = 385
      Align = alLeft
      Caption = '  Input Knapsack  '
      TabOrder = 0
      ExplicitLeft = -29
      ExplicitTop = 6
      object Label1: TLabel
        Left = 16
        Top = 48
        Width = 88
        Height = 20
        Caption = 'Max Weight'
      end
      object Label2: TLabel
        Left = 106
        Top = 99
        Width = 15
        Height = 20
        Caption = 'W'
      end
      object Label3: TLabel
        Left = 167
        Top = 99
        Width = 9
        Height = 20
        Caption = 'P'
      end
      object Label4: TLabel
        Left = 27
        Top = 128
        Width = 41
        Height = 20
        Caption = 'Item1'
      end
      object Label5: TLabel
        Left = 27
        Top = 162
        Width = 41
        Height = 20
        Caption = 'Item2'
      end
      object Label6: TLabel
        Left = 27
        Top = 196
        Width = 41
        Height = 20
        Caption = 'Item3'
      end
      object Label7: TLabel
        Left = 27
        Top = 230
        Width = 41
        Height = 20
        Caption = 'Item4'
      end
      object BitBtn1: TBitBtn
        Left = 119
        Top = 261
        Width = 75
        Height = 25
        Caption = 'Proses'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object Edit1: TEdit
        Left = 110
        Top = 45
        Width = 91
        Height = 28
        TabOrder = 1
        Text = '15'
      end
      object w1: TEdit
        Left = 95
        Top = 125
        Width = 43
        Height = 28
        TabOrder = 2
        Text = '2'
      end
      object p1: TEdit
        Left = 151
        Top = 125
        Width = 43
        Height = 28
        TabOrder = 3
        Text = '10'
      end
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 255
      Top = 3
      Width = 235
      Height = 385
      Align = alClient
      Caption = 'Output Knapsack'
      TabOrder = 1
      ExplicitLeft = 229
      ExplicitWidth = 318
      ExplicitHeight = 357
      object Memo1: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 25
        Width = 225
        Height = 355
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 136
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
  object p2: TEdit
    Left = 154
    Top = 203
    Width = 43
    Height = 28
    TabOrder = 2
    Text = '10'
  end
  object w2: TEdit
    Left = 98
    Top = 203
    Width = 43
    Height = 28
    TabOrder = 3
    Text = '4'
  end
  object p3: TEdit
    Left = 154
    Top = 237
    Width = 43
    Height = 28
    TabOrder = 4
    Text = '12'
  end
  object w3: TEdit
    Left = 98
    Top = 237
    Width = 43
    Height = 28
    TabOrder = 5
    Text = '6'
  end
  object p4: TEdit
    Left = 154
    Top = 271
    Width = 43
    Height = 28
    TabOrder = 6
    Text = '18'
  end
  object w4: TEdit
    Left = 98
    Top = 271
    Width = 43
    Height = 28
    TabOrder = 7
    Text = '9'
  end
end
