tempo += 0.05;

// Faz a escala oscilar suavemente entre escala_base ± escala_amplitude
var nova_escala = escala_base + sin(tempo) * escala_amplitude;

image_xscale = nova_escala;
image_yscale = nova_escala;
