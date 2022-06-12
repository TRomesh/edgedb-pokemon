module default {

    scalar type Result extending enum<Won, Lost, Tie>;

    type Pokemon {
        required property name -> str;
        required property description -> str;
        property height -> int64;
        property weight -> int64;
    }

    type Battle {
        property result -> Result;
        required link contender -> Pokemon;
        required link opponent -> Pokemon;
    }
}