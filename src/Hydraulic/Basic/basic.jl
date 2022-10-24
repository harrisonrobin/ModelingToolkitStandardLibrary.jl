function AirChamber(; name )
    """
    Todo 
    =====
    Imported Classed
    Callback interface
    Intilisation
    ODESytem
    """

    @named PartialCompliant 
    @named Environment 
    @parameters [
        A = 1, [tunable = yes, unit = u"m^2"] # area of piston
        p_precharge = 1e6 , [ tunable = yes, unit = u"bar" ] # precharge pressure
        V_precharge = 0.5 , [ tunable = yes, unit = u"m^3" ] # precharge volume
        residualVolume = 0 , [ tunable = yes, unit = u"m^3" ] # volume when chamber is fully compressed
        stopStiffness = 1e9 , [ unit = u"N/m" ] # stiffness when piston reaches stop
        p_init = P, [ unit = u"bar" ] # initial pressure
        V_init = V, [ unit = u"m^3" ] # initial volume
        f_stop = 0, [ unit = u"N/m" ]
        empty = false,
        initializePressure = true,
    ]

    @sts  [
        p,
        V,
        pV ~ p * V,
    ]


    eqs = [
        pV ~ p * V ,
        D(pV) ~ 0 ,
        V ~ s_rel*A + residualVolume ,
        f + f_stop ~ - A *(p - environment.p_ambient),
        f_stop ~ -s_rel*stopStiffness-der(s_rel)*10
    ]

end

function GenericPressureLoss(; name)
    @parameters [
        D_a , [ unit = u"mm"] # port A diameter
        D_b , [ unit = u"mm"] # port B diameter
        ζ1 = 2, # loss factor of port_a -> port_b
        ζ2 = 2, # loss factor of port_b -> port_a
        Re_turbulent = 1000,
        D_Re = D_a, # diameter used to compute Re 
        zetaLaminarKnown = false, # true if zeta = c0/Re laminar region
        c0 = 1, # zeta = c0/Re; dp = zeta*d_Re*v_Re^2/2, Re=v_Re*D_Re*d_Re/eta_Re
    ]
    
    eqs = [
        
    ]
end