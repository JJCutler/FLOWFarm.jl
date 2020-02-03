abstract type AbstractCombinationModel end

struct FreestreamLinearSuperposition <: AbstractCombinationModel
    # Lissaman 1979
    # new_deficit_sum = old_deficit_sum + wind_speed*deltav

end

struct SumOfSquaresFreestreamSuperposition <: AbstractCombinationModel
    # Katic et al. 1986
    # new_deficit_sum = sqrt(old_deficit_sum**2 + (wind_speed*deltav)**2)

end

struct SumOfSquaresLocalVelocitySuperposition <: AbstractCombinationModel
    # Voutsinas 1990
    # new_deficit_sum = sqrt(old_deficit_sum**2 + (turb_inflow*deltav)**2)

end

struct LinearLocalVelocitySuperposition <: AbstractCombinationModel
    # Niayifar and Porte Agel 2015, 2016
    # new_deficit_sum = old_deficit_sum + turb_inflow*deltav

end

function combination_model(deltav, wind_speed, old_deficit_sum, model::FreestreamLinearSuperposition)
    # Lissaman 1979
    
    new_deficit_sum = old_deficit_sum + wind_speed*deltav
    
    return new_deficit_sum

end

function combination_model(deltav, wind_speed, old_deficit_sum, model::SumOfSquaresFreestreamSuperposition)
    # Katic et al. 1986

    new_deficit_sum = sqrt((old_deficit_sum^2 + (wind_speed*deltav)^2))
    
    return new_deficit_sum

end

function combination_model(deltav, turb_inflow, old_deficit_sum, model::SumOfSquaresLocalVelocitySuperposition)
    # Voutsinas 1990

    new_deficit_sum = sqrt(old_deficit_sum^2 + (turb_inflow*deltav)^2)
    
    return new_deficit_sum

end

function combination_model(deltav, turb_inflow, old_deficit_sum, model::LinearLocalVelocitySuperposition)
    # Niayifar and Porte Agel 2015, 2016

    new_deficit_sum = old_deficit_sum + turb_inflow*deltav
    
    return new_deficit_sum

end
