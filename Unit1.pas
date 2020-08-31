unit Unit1;

interface

uses
  Windows, Messages, SysUtils,  Classes,  Controls, Forms,  Ucanvas, ExtCtrls;

const
n=10000;
bound=50;

type
  TParticles=record
      x,y:real;
      dx,dy:Real;
      Blink:Byte;
      BlinkF:integer;
      Size:Byte;
    End;

  TForm1 = class(TForm)
    tmr1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Particles:array[1..n] of TParticles;
    c:NCanvas;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Form1.Close
end;

procedure TForm1.FormShow(Sender: TObject);
 var z:Word;
begin
 BorderStyle:=bsNone;
 ClientHeight:=Screen.Height;
 ClientWidth:=Screen.Width;
 WindowState:=wsMaximized;
 c:=NCanvas.create(ClientWidth,clientHeight);
 c.redraw(canvas);
 for z := 1 to n do
   begin
     Particles[z].x:=bound+Random(Clientwidth-bound*2);
     Particles[z].y:=bound+Random(Clientheight-bound*2);
     Particles[z].dx:=(100-Random(200))/400;
     Particles[z].dy:=(70+Random(30))/100;//(100-Random(200))/100;
     Particles[z].Blink:=Random(256);
     Particles[z].BlinkF:=1-random(3);
     Particles[z].Size:=Random(3);
   end;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
 var z:Word;x,y:Word;
begin
  for z := 1 to n-1 do
   begin
    Particles[z].x:=Particles[z].x+Particles[z].dx;
    Particles[z].y:=Particles[z].y+Particles[z].dy;
    if (Particles[z].dx>0) and (Particles[z].x>=ClientWidth-bound) then Particles[z].x:=bound;
    if (Particles[z].dx<0) and (Particles[z].x<=bound) then Particles[z].x:=ClientWidth-bound;
    if (Particles[z].dy>0) and (Particles[z].y>=ClientHeight-bound) then Particles[z].y:=bound;
    if (Particles[z].dy<0) and (Particles[z].y<=bound) then Particles[z].y:=ClientHeight-bound;
    Particles[z].Blink:=Particles[z].Blink+Particles[z].BlinkF;
    if (Particles[z].Blink=255) and (Particles[z].BlinkF=1) then Particles[z].BlinkF:=-1;
    if (Particles[z].Blink=0) and (Particles[z].BlinkF=-1) then Particles[z].BlinkF:=1;
    x:=Round(Particles[z].x);
    y:=Round(Particles[z].y);
    //c.color(0,Particles[z].Blink,0);
    c.color(0,255,0);
    c.pixel(x,y);
    if Particles[z].Size=1 then
    Begin
      c.color(0,150,0);
      c.pixel(x,y);
      c.pixel(x+1,y);
      c.pixel(x-1,y);
      c.pixel(x,y+1);
      c.pixel(x,y-1);
    End;
    if Particles[z].Size=2 then
    Begin
      c.color(0,50,0);
      c.pixel(x,y);
      c.pixel(x+1,y);
      c.pixel(x+1,y+1);
      c.pixel(x+1,y-1);
      c.pixel(x-1,y+1);
      c.pixel(x-1,y-1);
      c.pixel(x-1,y);
      c.pixel(x,y+1);
      c.pixel(x,y-1);
      c.pixel(x,y-2);
      c.pixel(x,y+2);
      c.pixel(x+2,y);
      c.pixel(x-2,y);
    End;
   end;
  c.redraw(Canvas);
end;

end.
