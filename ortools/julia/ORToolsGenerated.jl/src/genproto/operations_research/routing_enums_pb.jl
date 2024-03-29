# Autogenerated using ProtoBuf.jl v1.0.14 on 2024-01-02T18:44:46.401
# original file: /usr/local/google/home/tcuvelier/.julia/artifacts/cc3d5aa28fb2158ce4ff5aed9899545a37503a6b/include/ortools/constraint_solver/routing_enums.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export LocalSearchMetaheuristic, FirstSolutionStrategy, var"FirstSolutionStrategy.Value"
export var"LocalSearchMetaheuristic.Value"

struct LocalSearchMetaheuristic  end

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:LocalSearchMetaheuristic})
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        PB.skip(d, wire_type)
    end
    return LocalSearchMetaheuristic()
end

function PB.encode(e::PB.AbstractProtoEncoder, x::LocalSearchMetaheuristic)
    initpos = position(e.io)
    return position(e.io) - initpos
end
function PB._encoded_size(x::LocalSearchMetaheuristic)
    encoded_size = 0
    return encoded_size
end

struct FirstSolutionStrategy  end

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:FirstSolutionStrategy})
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        PB.skip(d, wire_type)
    end
    return FirstSolutionStrategy()
end

function PB.encode(e::PB.AbstractProtoEncoder, x::FirstSolutionStrategy)
    initpos = position(e.io)
    return position(e.io) - initpos
end
function PB._encoded_size(x::FirstSolutionStrategy)
    encoded_size = 0
    return encoded_size
end

@enumx var"FirstSolutionStrategy.Value" UNSET=0 AUTOMATIC=15 PATH_CHEAPEST_ARC=3 PATH_MOST_CONSTRAINED_ARC=4 EVALUATOR_STRATEGY=5 SAVINGS=10 SWEEP=11 CHRISTOFIDES=13 ALL_UNPERFORMED=6 BEST_INSERTION=7 PARALLEL_CHEAPEST_INSERTION=8 SEQUENTIAL_CHEAPEST_INSERTION=14 LOCAL_CHEAPEST_INSERTION=9 LOCAL_CHEAPEST_COST_INSERTION=16 GLOBAL_CHEAPEST_ARC=1 LOCAL_CHEAPEST_ARC=2 FIRST_UNBOUND_MIN_VALUE=12

@enumx var"LocalSearchMetaheuristic.Value" UNSET=0 AUTOMATIC=6 GREEDY_DESCENT=1 GUIDED_LOCAL_SEARCH=2 SIMULATED_ANNEALING=3 TABU_SEARCH=4 GENERIC_TABU_SEARCH=5
