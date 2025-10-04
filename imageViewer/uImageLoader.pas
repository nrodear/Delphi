unit uImageLoader;

interface
uses
  Vcl.Graphics, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,
  System.Classes,
  Vcl.ExtCtrls, Vcl.Forms, System.SysUtils;

type

 TImageLoader= record

  private
   class procedure LoadJPEG(const FileName: string; ZielImage: TImage);static;
   class procedure LoadPNG(const FileName: string; ZielImage: TImage);static;
    class procedure LoadJPEG1(const FileName: string; ZielImage: TImage); static;
    class procedure LoadJPEGFromStream(Stream: TStream; TargetImage: TImage); static;
    class procedure Load1(FileName: string; ZielImage: TImage); static;


  public
    class procedure Load(const FileName: string; ZielImage: TImage);static;
 end;


implementation


class procedure TImageLoader.Load1(FileName: string; ZielImage: TImage);
begin

    try
      ZielImage.Picture.LoadFromFile(FileName);
    except
      on E: Exception do
        raise Exception.Create('Fehler beim Laden: ' + E.Message);
    end;

end;



class procedure TImageLoader.Load(const FileName: string; ZielImage: TImage);
var
  ext : string;
begin
  ext := ExtractFileExt(FileName);

  if ext = '.jpg' then
      LoadJPEG1(FileName,ZielImage)
  else if ext = '.png' then
      LoadPNG(FileName,ZielImage)
  else
    raise Exception.Create('exception on load');

  ZielImage.Visible := false;
  ZielImage.Stretch := True;
  ZielImage.Proportional := True;

end;

class procedure TImageLoader.LoadJPEG1(const FileName: string; ZielImage: TImage);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadJPEGFromStream(FileStream, ZielImage);
  finally
    FileStream.Free;
  end;
end;

class procedure TImageLoader.LoadJPEGFromStream(Stream: TStream; TargetImage: TImage);
var
  JPEG: TJPEGImage;
begin
  JPEG := TJPEGImage.Create;
  try
    Stream.Position := 0; // Wichtig: Stream zurücksetzen
    JPEG.LoadFromStream(Stream);
    TargetImage.Picture.Assign(JPEG);
  finally
    JPEG.Free;
  end;
end;

class procedure TImageLoader.LoadJPEG(const FileName: string; ZielImage: TImage);
var
  JPEG: TJpegImage;
begin
  JPEG := TJpegImage.Create;
  try
    JPEG.LoadFromFile(FileName);
    ZielImage.Picture.Assign(JPEG);
  finally
    JPEG.Free;
  end;
end;

class procedure TImageLoader.LoadPNG(const FileName: string; ZielImage: TImage);
var
  PNG: TPngImage;
begin
  PNG := TPngImage.Create;
  try
    PNG.LoadFromFile(FileName);
    ZielImage.Picture.Assign(PNG);
  finally
    PNG.Free;
  end;
end;


end.
