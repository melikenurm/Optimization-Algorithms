function beta = powell(x_0, x_new, g)
    beta_polak = polak_ribiere(x_0, x_new, g)
    beta = max(0, beta_polak)
end