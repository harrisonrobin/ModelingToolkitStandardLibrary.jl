"""
Library of electrical models.
This library contains electrical components to build up analog circuits.
"""
module Hydraulic

using ModelingToolkit, Symbolics, IfElse
using OffsetArrays
using ..Thermal: HeatPort
using ..Mechanical.Rotational: Flange, Support
using ..Blocks: RealInput, RealOutput

@parameters t
D = Differential(t)

export 
include("Basic/basic.jl")

end
