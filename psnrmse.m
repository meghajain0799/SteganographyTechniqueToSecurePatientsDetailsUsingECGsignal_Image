function [PSNR, MSE] = psnrmse(Image1,Image2)
x = double(Image1);
y = double(Image2);
[r, c] = size(x);
error = x - y;
MSE = sum(sum(error .* error)) / (r * c);
if(MSE > 0)
    PSNR = 10*log10(255./MSE);
else
    PSNR = 99;
end

  %MSE = (sum(sum((x - y) .^ 2)))/(r*c);
  %MSE = sum((x(:)-y(:)).^2) / numel(x);
  %MSE = (sum(sum((x - y).^2))/(r * c));
  %PSNR = 10*log10((256*256)/MSE);
  %PSNR = 10*log((256*256)/MSE);
 end

   