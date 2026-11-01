import { butterPanFriedShrimp } from "./butterPanFriedShrimp";
import { catalogExpansionRecipes } from "./catalogExpansionRecipes";
import { colaChickenWings } from "./colaChickenWings";
import { cornRibSoup } from "./cornRibSoup";
import { steamedSeaBass } from "./steamedSeaBass";
import { threeFresh } from "./threeFresh";
import { tomatoScrambledEggs } from "./tomatoScrambledEggs";

export const recipeCatalog = [
  tomatoScrambledEggs,
  colaChickenWings,
  threeFresh,
  butterPanFriedShrimp,
  cornRibSoup,
  steamedSeaBass,
  ...catalogExpansionRecipes,
] as const;
