unit Ucanvas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics;

type
  NCanvas = class
      public
        procedure redraw(target:TCanvas);
        procedure pixel(x,y:Word);
        procedure color(r,g,b:byte);
        constructor create(w,h:word);
      private
        Colour:TColor;
        width,
        height:Word;
        BackBuffer:TBitmap;
        BBArr:array of PByteArray;
  end;

implementation

constructor NCanvas.create;
 var z:Word;
begin
 BackBuffer:=TBitmap.Create;
 Width:=w;
 Height:=h;
 BackBuffer.Width:=w;
 BackBuffer.Height:=h;
 BackBuffer.PixelFormat:=pf24bit;
 BackBuffer.Canvas.Brush.Color:=clBlack;
 SetLength(BBArr,h);
 for z := 1 to BackBuffer.Height-1 do
    BBArr[z]:=BackBuffer.ScanLine[z];
end;

procedure NCanvas.redraw;
begin
  target.Draw(0,0,BackBuffer);
  BackBuffer.Canvas.FillRect(Rect(0,0,width,height));
end;

procedure NCanvas.color(r: Byte; g: Byte; b: Byte);
begin
  Colour:=RGB(r,g,b);
end;

procedure NCanvas.pixel(x: Word; y: Word);
begin
  BBArr[y][x*3]:=GetRValue(Colour);
  BBArr[y][x*3+1]:=GetGValue(Colour);
  BBArr[y][x*3+2]:=GetBValue(Colour);
end;

end.
