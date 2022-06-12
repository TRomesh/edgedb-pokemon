CREATE MIGRATION m1vbrrpio2d7yeyj4gudqkopqdd6rltyyqhr2wbyrj6fewjjti4gqq
    ONTO initial
{
  CREATE TYPE default::Pokemon {
      CREATE REQUIRED PROPERTY description -> std::str;
      CREATE PROPERTY height -> std::int64;
      CREATE REQUIRED PROPERTY name -> std::str;
      CREATE PROPERTY weight -> std::int64;
  };
  CREATE SCALAR TYPE default::Result EXTENDING enum<Won, Lost, Tie>;
  CREATE TYPE default::Battle {
      CREATE REQUIRED LINK contender -> default::Pokemon;
      CREATE REQUIRED LINK opponent -> default::Pokemon;
      CREATE PROPERTY result -> default::Result;
  };
};
