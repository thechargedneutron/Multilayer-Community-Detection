function output = hilbert_envelope(x)

%Calculates envelope of the signal. Brookes et. al 2016

y = hilbert(x);
output = abs(y);

end