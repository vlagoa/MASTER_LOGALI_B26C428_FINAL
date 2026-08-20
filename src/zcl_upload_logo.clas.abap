CLASS zcl_upload_logo DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_upload_logo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_lineas TYPE TABLE OF string,
          lv_base64 TYPE string.

    lt_lineas = VALUE #(
      ( `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAY` )
      ( `A6/NlyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcw` )
      ( `AADsMAAA7DAcdvqGQAAAp+SURBVGhD7dZ7kFxVnQfw77mPfk33THoy79` )
      ( `lMJg8SksnLkBB3DZIFVnRFENcEWZdixRRo7dZaLlWrWJpAibuWqKvFrm` )
      ( `vAxwqWaEYMmiyQSmkYXktIhkCSaTKTeSSdme7pnn7dvs9z73nsHyxWaF` )
      ( `dMfhXf6q6+t5zT5/f71t17+0DNDQ0NDQ0NDQ0NDQ0NPwmUjvwdjmVk1` )
      ( `2dLfzvJCHX+sByTyBS8WUx58rjaYMPfnJF+CkQImt/d6m97YH37pXqu2` )
      ( `bgn2sJKfecsGXkhZJEqixQdDgQMCxQJfoSGkIh/Vi66P79nnc3p2rXuJ` )
      ( `Te1sB790r1uhvFjygh2x/JSpysSJQcDssJ4DgBXMcHpQyeF6BVA9b0tZ` )
      ( `rZgvu+w7d2vli71qVyyQN/f0pGrkoGA9EQohpR38MV8vmvnZXIOhIlm8` )
      ( `Ewffxtt8ACBLh/2IbhMPg0APV8qIxjeV/nbL5cXvPni1LG6uizedlsH7` )
      ( `9nMlZ29nxxA3etQ4FleSLUk8e5IVHbUz3mFfj+Cf9K6NrjL1eJajOACW` )
      ( `DUAn4+C/x8VuLFOYFnMwwvZXwotoN+aWNth47UZB6K76FcdRBGgPbeDj` )
      ( `z0rf2AECCuBeL6x1s3rv8Li2nJqZnqrpKp3EVt52Hm+6d9+dgP+RdvLY` )
      ( `tQT74l3pmgG24PkBq86J3ZvJ5hg5G7XypBPWeBTFkgT0wL7J/mSFcYfC` )
      ( `cANX14VRfV9CyWahS3bU7ia99/Bu9652XIpDPwKiXYpoXjR0+hp78Dq7` )
      ( `ZuwpY772R9V11jVCret02DPuY7vMD84Fn3s0t+plJWCQe3fgIAMHQvh0` )
      ( `ZlEpPx2r7qMa+Nx8dH+MTJMpYoUiJbDcC4AJESggtwJkArFqzRKazojq` )
      ( `NfFjF1JoNrP7QNhx/dh5HXprB2fT+WX7keyqIVyJzN4NzJ12E6/DPtN9` )
      ( `44wqWSMcr0C5zhOYHgVe7JW7x7+j55Yf3uG/bELK0YNZ/4XPHC8XrMK/` )
      ( `CNx9joyby4zDY9UNeHSiQgBSQXoNk83PGz6OxuQTgzioVL+hGRDJPPv4` )
      ( `S1mwew6drNMF2G/31xBKfTVbjxXijNbSdURv+5baC/wKkwPDvoY0zMWf` )
      ( `5/jyE1QDC4g19Yv/uG3TGihaOZP1Xgq57zHzpfZDtnxrIEkkuFABACPJ` )
      ( `0GmysgKgyEjPNo7ulFRzKONVvWoad3IU6+OolXxkrIyqQkze0vIwie0C` )
      ( `w6qXWDlyMwwX/nVd0kT1dYbJiTTOwIg5saAHe204QhcArGQ+m4cKxA7x` )
      ( `/SQzTZYqRqSLKlCAmfZyemMW2Tf0YPDyKVLqCRLqCisdG5zzlusEPNv8` )
      ( `1l5n5evs3pj9Wf9lz+QP/s0jmWhPa0bCmPZsMk8/vSQtMGhyWHaBUpVA` )
      ( `nb6Vckhx6wflksZwvHfQ4+nxOaMWiD2/btq3uHHU/C/TgNz1c86njQov` )
      ( `eR6Otd8APUpxLRfrsuzUYe1Bw6Unb3iWEfhengpHMH8r7w9v0b6K9i7H` )
      ( `w167m+j9FIs1uN3H9v2lGfM620Z19X339el2SwIdzMt6T6PhVvWvFjwg` )
      ( `h2x/JSpysSJQcDssJ4DgBXMcHpQyeF6BVA9b0tZrZgvu+w7d2vli71qY` )
      ( `yQN/f0pGrkoGA9EQohpR38MV8vmvnZXIOhIlm8Ewffxtt8ACBLh/2Ibh` )
      ( `MPg0APV8qIxjeV/nbL5cXvPni1LG6uizedlsH79nMlZ29nxxA3etQ4Fl` )
      ( `eSLUk8e5IVHbUz3mFfj+Cf9K6NrjL1eJajOACWDUAn4+C/x8VuLFOYFn` )
      ( `MwwvZXwotoN+aWNth47UZB6K76FcdRBGgPbeDjz0rf2AECCuBeL6x1s3` )
      ( `rv8Li2nJqZnqrpKp3EVt52Hm+6d9+dgP+RdvLYtQT74l3pmgG24PkBq8` )
      ( `6J3ZvJ5hg5G7XypBPWeBTFkgT0wL7J/mSFcYfCcANX14VRfV9CyWahS3` )
      ( `bU7ia99/Bu9652XIpDPwKiXYpoXjR0+hp78Dq7ZuwpY772R9V11jVCre` )
      ( `t02DPuY7vMD84Fn3s0t+plJWCQe3fgIAMHQvh0ZlEpPx2r7qMa+Nx8dH` )
      ( `+MTJMpYoUiJbDcC4AJESggtwJkArFqzRKazojqNfFjF1JoNrP7QNhx/d` )
      ( `h5HXprB2fT+WX7keyqIVyJzN4NzJ12E6/DPtN944wqWSMcr0C5zhOYHg` )
      ( `Ve7JW7x7+j55Yf3uG/bELK0YNZ/4XPHC8XrMK/CNx9joyby4zDY9UNeH` )
      ( `SiQgBSQXoNk83PGz6OxuQTgzioVL+hGRDJPPv4S1mwew6drNMF2G/31x` )
      ( `BKfTVbjxXijNbSdURv+5baC/wKkwPDvoY0zMWf5/jyE1QDC4g19Yv/uG` )
      ( `TGihaOZP1Xgq57zHzpfZDtnxrIEkkuFABACPJ0GmysgKgyEjPNo7uI` )
      ( `FRzKONVvWoad3IU6+OolXxkrIyqQkze0vIwie0CzjZ/6ebWdqa/w+yeu` )
      ( `+3IIkUB78rFF77Q+ZV+B3HCgtZtHY8NjhUwup6UriU8hsGshPo0l10bZ` )
      ( `yCXqu3Ij2nnbMTWRxfnIOM1bIJInWX0KRByJm8Snn4fdla9etR/vVu+N` )
      ( `6MhzOlKmBoftY7fU/ZF6BAeDy/cU1aij8XTs9s1nkstCiYcR7OxHYAcz` )
      ( `0LKrpjGdaylGEm4ZUTR5i9rEjGLw3wPZBBRhRF+ffeGG2rezhw+WkwOq` )
      ( `Rt75xUykCbH/jOD9ClkdbVZFwI8yRSojHnPGnP0XfMr9O8w78pqXfGV/` )
      ( `DXW9zdWS8zTg7G0DXc2pIO91JIqenBzoCpOYkVm+XSA2SK5JlBQCGRzM` )
      ( `SHQPyLSFTA+Tq/AgZAoCOAYn8CLn6gjrWyh4SH83IoaH7OICL/jtqqEf` )
      ( `voLGlbz99cvH/BEMrf1H+2LpD3kO1c36bW172fjicsW4zbO/Ttdcu1om` )
      ( `Jic69Us5rw4SLuaU7H8k28ejCSV3QT0P651QiV+rxBbeT4tx21rJgBxH` )
      ( `+pKryUyrHYk1HmivaIoUHFYQT2+K68k/fWu0/vL413GXY9OVwSA1Rxs8` )
      ( `SzlUB2RYLh8HxaOgxw/V3EIKI4/jHQprabFIxlYhpG4gUC8PhUNNctfJ` )
      ( `cV3PLk7ZHv+QG9OlkInFT1aSHuxcmRmr7/V3q3mmZVF5OHV7K3pL4UfY` )
      ( `jC1/wA3bUciTMWPIn1ONRH7FdLgv9iyPDdzgsvNFjkZ0OSRz0TC+Ys9B` )
      ( `cpiAWAwmH1f+wPbokHgn9IBTSd0bCob9SNOX+ou09oKlkOyS2RKOhXZG` )
      ( `w/mBLTLtNVXCF5wddfsBuTkSadjKAOJSRRDTxlOMG7dFo6Ondu3fXnaP` )
      ( `uibpFJ6jLu8L/PnN9cvexPqfkL3OqjFBb9Hrpwk9dwz/hWbzbtmXINFi` )
      ( `zZfgxqyqi9MTYo3aVV2wXskwBw5Nyz+AzX3UZIjYDKg573PGR5gLLq55` )
      ( `oWTSQ0wq3AyER6X68TnDG1P06K2UK5JDLzieLOfzpYMeR5/PCa1Y9OFt` )
      ( `27bVnaPuZ4Ee/KaHaz51XGjR+2i09Q74QYpzqUiffZeHYg8KLj1p27uF` )
      ( `mO/ilC3igRjmrj/mJ1rvZS7Pb+sIno+pggnGY6+fK/541dLurbbLRmhA` )
      ( `TzGp9gS+/4iQ2p0CylbTZV8IGJuigYjYfrAP0G7yfFahPnvFY5KGo023` )
      ( `USr+KxDko37A3c3rL3+itt8/LSkJAPz6Vvv/cyklkVKSvXul+ubxm/Mu` )
      ( `PH/z++0w34XJ6t179d54i75x8UJty+IuLaIriqo45PoNy/NHJoo7TTvY` )
      ( `H4/p1ySi+rTLmNy0uPX5iVx1qwpIXSf9Xjk4oMW1tT4P4rqqNHEi8wrH` )
      ( `VlsJHowK/fZl3a3/OVYoNPuOps0Vp8TZVyteU9NcsGPHW/fVF2u+gX+v` )
      ( `I6O5DTmTjXV3RJa1JZTzZoV1GaaTa01E+xNq22lHzTZd3ttbOD0z0xbR` )
      ( `W3QGHmeBVQ6RaJNTSmZj7eVVSztbX6tdt6GhoaGhoaGhoaGhoaGhoaG` )
      ( `hAcD/AYEV0Ve1NWFdAAAAAElFTkSuQmCC` )
    ).



    lv_base64 = concat_lines_of( table = lt_lineas ).


    DELETE FROM ztlogos_4518 WHERE logo_id = 'COMP_LOGO'.


    DATA(ls_logo) = VALUE ztlogos_4518( logo_id = 'COMP_LOGO' logo_text = lv_base64 ).
    INSERT ztlogos_4518 FROM @ls_logo.

    out->write( '¡Logo global guardado con éxito en la tabla transparente!' ).
  ENDMETHOD.
ENDCLASS.

