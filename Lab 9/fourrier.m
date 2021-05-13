function outimg = fourrier(inimg,f,ch)
    q=3;
    [m,n]=size(inimg);
    fft=fftshift(fft2(inimg));
    f=f*sqrt(m^2+n^2);
    h=zeros(m,n);
    
    for i=1:m
        for j=1:n
            d=sqrt(abs(i-m/2)^2+abs(j-n/2)^2);
            if ch==1 %lf-ideal
                if(d < f)
                    h(i,j)=1;
                end
            elseif ch==2 %lf-butter
                h(i,j)=1/(1+(d/f)^(2*n));
            elseif ch==3 %lf-gaussian
                h(i,j)=exp(-(d^2)/(2*f^2));
            elseif ch==4 %hf-ideal
                if(d > f)
                    h(i,j)=1;
                end
            elseif ch==5 %hf-butter
                h(i,j)=1/(1+(f/d)^(2*n));
            elseif ch==6 %hf-gaussian
                h(i,j)=1-exp(-(d^2)/(2*f^2));
            else
                break
            end
        end
    end
    g=h.*fft;
    g=ifftshift(g);
    outimg=uint8(real(ifft2(g)));
end