# test/runtests.jl
using DesertIslandDisk, Test

function tests()
  @testset "DesertIslandDisk swap() tests" begin
    @test swap(2,3) == (3,2)
    @test swap(2.0,3.1) == (3.1,2.0)
    @test swap('D',2) == (2,'D')
    @test swap('D',"hello") == ("hello",'D')
    A = [3,4,5]
    B = "gonna be good"
    @test swap(A,B) == (B,A)
  end
end

tests()
