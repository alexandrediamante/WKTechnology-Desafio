object FrmPedidos: TFrmPedidos
  Left = 0
  Top = 0
  Caption = 'Wk-Pedidos'
  ClientHeight = 463
  ClientWidth = 881
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 21
  object pnlBotton: TPanel
    Left = 0
    Top = 419
    Width = 881
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 3
    Padding.Right = 10
    Padding.Bottom = 3
    TabOrder = 1
    ExplicitWidth = 874
    object lblTotalGeral: TLabel
      Left = 828
      Top = 11
      Width = 30
      Height = 21
      BiDiMode = bdRightToLeft
      Caption = '0,00'
      ParentBiDiMode = False
    end
    object btnCancelarPed: TButton
      Left = 155
      Top = 3
      Width = 160
      Height = 38
      Align = alLeft
      Caption = 'Cancelar Pedido'
      TabOrder = 1
      TabStop = False
      OnClick = btnCancelarPedClick
    end
    object btnListarPed: TButton
      Left = 317
      Top = 3
      Width = 143
      Height = 38
      Align = alLeft
      Caption = 'Listar Pedido'
      TabOrder = 0
      TabStop = False
      OnClick = btnListarPedClick
    end
    object btnSeparador2: TButton
      Left = 315
      Top = 3
      Width = 2
      Height = 38
      Align = alLeft
      TabOrder = 2
      TabStop = False
      StyleName = 'Windows10 Blue'
    end
    object btnGravarPedido: TButton
      Left = 10
      Top = 3
      Width = 143
      Height = 38
      Align = alLeft
      Caption = 'Gravar Pedido'
      TabOrder = 3
      TabStop = False
      OnClick = btnGravarPedidoClick
    end
    object btnSeparador1: TButton
      Left = 153
      Top = 3
      Width = 2
      Height = 38
      Align = alLeft
      TabOrder = 4
      TabStop = False
      StyleName = 'Windows10 Blue'
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 0
    ExplicitWidth = 874
    object edtCodigoCliente: TLabeledEdit
      Left = 11
      Top = 33
      Width = 121
      Height = 29
      BorderStyle = bsNone
      EditLabel.Width = 102
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo Cliente'
      NumbersOnly = True
      TabOrder = 0
      Text = ''
      OnExit = edtCodigoClienteExit
      OnKeyPress = FormKeyPress
    end
    object edtNomeCliente: TLabeledEdit
      Left = 138
      Top = 33
      Width = 719
      Height = 29
      TabStop = False
      BorderStyle = bsNone
      EditLabel.Width = 117
      EditLabel.Height = 21
      EditLabel.Caption = 'Nome do Cliente'
      ReadOnly = True
      TabOrder = 1
      Text = ''
      OnKeyPress = FormKeyPress
    end
    object edtCodigoProduto: TLabeledEdit
      Left = 10
      Top = 97
      Width = 121
      Height = 29
      BorderStyle = bsNone
      EditLabel.Width = 110
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo Produto'
      NumbersOnly = True
      TabOrder = 2
      Text = ''
      OnExit = edtCodigoProdutoExit
      OnKeyPress = FormKeyPress
    end
    object edtQuantidade: TLabeledEdit
      Left = 457
      Top = 97
      Width = 88
      Height = 29
      BorderStyle = bsNone
      EditLabel.Width = 81
      EditLabel.Height = 21
      EditLabel.Caption = 'Quantidade'
      TabOrder = 3
      Text = ''
      OnKeyPress = FormKeyPress
    end
    object edtValorUnitario: TLabeledEdit
      Left = 551
      Top = 97
      Width = 121
      Height = 29
      BorderStyle = bsNone
      EditLabel.Width = 96
      EditLabel.Height = 21
      EditLabel.Caption = 'Valor Unit'#225'rio'
      TabOrder = 4
      Text = ''
      OnKeyPress = FormKeyPress
    end
    object btnInserir: TButton
      Left = 678
      Top = 91
      Width = 179
      Height = 38
      Caption = '&Inserir'
      TabOrder = 5
      OnClick = btnInserirClick
    end
    object edtCodigoProdutoDesc: TLabeledEdit
      Left = 138
      Top = 97
      Width = 313
      Height = 29
      TabStop = False
      BorderStyle = bsNone
      EditLabel.Width = 56
      EditLabel.Height = 21
      EditLabel.Caption = 'Produto'
      ReadOnly = True
      TabOrder = 6
      Text = ''
      OnKeyPress = FormKeyPress
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 137
    Width = 881
    Height = 282
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 2
    ExplicitWidth = 874
    object dbgrdPedidos: TDBGrid
      Left = 10
      Top = 10
      Width = 861
      Height = 262
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPedidos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = dbgrdPedidosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 317
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          ReadOnly = True
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Unitario'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 186
          Visible = True
        end>
    end
  end
  object dsPedidos: TDataSource
    DataSet = cdsPedidos
    OnStateChange = dsPedidosStateChange
    Left = 368
    Top = 288
  end
  object cdsPedidos: TClientDataSet
    PersistDataPacket.Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F0006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      44544802000200140008556E69746172696F0800040000000100075355425459
      50450200490006004D6F6E6579000A7175616E74696461646504000100000000
      000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'quantidade'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = cdsPedidosAfterPost
    OnCalcFields = cdsPedidosCalcFields
    Left = 464
    Top = 233
    object cdsPedidosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsPedidosDescricao: TStringField
      FieldName = 'Descricao'
    end
    object cdsPedidosUnitario: TCurrencyField
      FieldName = 'Unitario'
      Required = True
    end
    object cdsPedidosquantidade: TIntegerField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '.00'
    end
    object cdsPedidosTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = 'R$ #,##0.00'
      Calculated = True
    end
  end
end
