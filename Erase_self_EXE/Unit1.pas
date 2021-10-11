unit Unit1;

interface

uses
  Windows, SysUtils, Forms, StdCtrls, Classes, Controls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

  procedure SelfEfface;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure SelfEfface;
var
 F: Textfile;
begin
 AssignFile(F,Changefileext(Paramstr(0),'.bat'));
 Rewrite(F);
 Writeln(F,':1');
 Writeln(F, Format('Erase "%s"',[Paramstr(0)]));
 Writeln(F, Format('If exist "%s" Goto 1',[Paramstr(0)]));
 Writeln(F, Format('Erase "%s"',[ChangeFileExt(Paramstr(0),'.bat')]));
 CloseFile(F);
 WinExec(PChar(ChangeFileExt(Paramstr(0),'.bat')),SW_HIDE);
 Halt;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 SelfEfface;
end;

end.
