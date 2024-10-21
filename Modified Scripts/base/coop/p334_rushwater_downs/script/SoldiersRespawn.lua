State
{
  StateName = "SPAWN",

  OnFigureRespawnEvent
  {
    WaitTime = 5,
    X = 301,
    Y = 323,
    Conditions =
    {
    },
    Actions =
    {
      FigureWalk {Tag = "Soldier1", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier2", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier3", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier4", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier5", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier6", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier7", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier8", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier9", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier10", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier11", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier12", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier13", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier14", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier15", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier16", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier17", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier18", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "Soldier19", X = GetEntityX(), Y = GetEntityY()},
    },
  };
};
