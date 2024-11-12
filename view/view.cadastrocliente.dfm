object FormCliente: TFormCliente
  Left = 0
  Top = 0
  Caption = 'FormCliente'
  ClientHeight = 193
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 145
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object edtCodigo: TLabeledEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 29
      EditLabel.Width = 50
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 0
      Text = ''
    end
    object edtNome: TLabeledEdit
      Left = 87
      Top = 32
      Width = 394
      Height = 29
      EditLabel.Width = 43
      EditLabel.Height = 21
      EditLabel.Caption = 'Nome'
      TabOrder = 1
      Text = ''
    end
    object edtCidade: TLabeledEdit
      Left = 8
      Top = 88
      Width = 353
      Height = 29
      EditLabel.Width = 48
      EditLabel.Height = 21
      EditLabel.Caption = 'Cidade'
      TabOrder = 2
      Text = ''
    end
    object edtEstado: TLabeledEdit
      Left = 367
      Top = 88
      Width = 114
      Height = 29
      EditLabel.Width = 46
      EditLabel.Height = 21
      EditLabel.Caption = 'Estado'
      TabOrder = 3
      Text = ''
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 492
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 5
    TabOrder = 1
    object btnSalvar: TButton
      Left = 382
      Top = 5
      Width = 100
      Height = 38
      Align = alRight
      Caption = 'Salvar'
      Default = True
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 282
      Top = 5
      Width = 100
      Height = 38
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 0
    end
  end
end
