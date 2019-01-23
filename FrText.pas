unit FrText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Clipbrd, TextDlgs;

type
  TTextForm = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    TextSaveDialog1: TTextSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  TextForm: TTextForm;

implementation

{$R *.dfm}

uses ModMain;

procedure TTextForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TTextForm.Button3Click(Sender: TObject);
begin
  Clipboard.SetTextBuf(PAnsiChar(Memo1.Text));
end;

procedure TTextForm.Button1Click(Sender: TObject);
begin
  with TextSaveDialog1 do begin
    if Execute then begin
      Memo1.Lines.SaveToFile(FileName);
      DataModule1.ExtIniFile1.WriteStr('FilePathSaveDialog', 'InitialDir', ExtractFileDir(FileName));
    end;
  end;
end;

end.