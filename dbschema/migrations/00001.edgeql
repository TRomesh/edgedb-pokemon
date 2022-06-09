CREATE MIGRATION m1rrwbzser5ckgjo3uzpmz726a3y6omc7tcme4mk36ec6gihds64ga
    ONTO initial
{
  CREATE TYPE default::Pokemon {
      CREATE REQUIRED PROPERTY description -> std::str;
      CREATE PROPERTY height -> std::int64;
      CREATE REQUIRED PROPERTY name -> std::str;
      CREATE PROPERTY weight -> std::int64;
  };
  CREATE TYPE default::Battle {
      CREATE LINK contender -> default::Pokemon;
      CREATE LINK opponent -> default::Pokemon;
      CREATE PROPERTY result -> std::str;
  };
};
