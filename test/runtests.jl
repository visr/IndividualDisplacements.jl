using Test, Documenter
using IndividualDisplacements, MeshArrays, OrdinaryDiffEq, OceanStateEstimation
include(joinpath(dirname(pathof(IndividualDisplacements)),"../test/helper_functions.jl"))

IndividualDisplacements.get_ecco_velocity_if_needed();
IndividualDisplacements.get_occa_velocity_if_needed();

@testset "test1" begin
    uvetc,sol=test1_setup()
    @test isapprox(sol[1,end],23.4474; atol=0.01)
    @test isapprox(sol[2,end],8.0896; atol=0.01)
end

@testset "test2" begin
    df,𝑃=test2_periodic_domain()
    @test prod(isapprox.(df[end-35:6:end,:y],12*(0.4:0.04:0.6)))
    @test prod(isapprox.(df[end-5:end,:x],12*(0.4:0.04:0.6).+4.0))
end

@testset "doctests" begin
    doctest(IndividualDisplacements; manual = false)
end
