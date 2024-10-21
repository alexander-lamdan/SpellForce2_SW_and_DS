State
{
  StateName = "SPAWN",

  OnFigureRespawnEvent
  {
    WaitTime = 3,
    X = 257,
    Y = 588,
    Conditions =
    {
    },
    Actions =
    {
      FigureWalk {Tag = "FirstGate1", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate2", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate3", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate4", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate5", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate6", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate7", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate8", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate9", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate10", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate11", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate12", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate13", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate14", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate15", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate16", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate17", X = GetEntityX(), Y = GetEntityY()},
      FigureWalk {Tag = "FirstGate18", X = GetEntityX(), Y = GetEntityY()},
    },
  };
};
