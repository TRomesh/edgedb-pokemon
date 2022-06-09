module default {
    type Pokemon {
        required property name -> str;
        required property description -> str;
        property height -> int64;
        property weight -> int64;
    }

    type Battle {
         link contender -> Pokemon;
         link opponent -> Pokemon;
         property result -> str;
    }
}