CREATE MIGRATION m1lyriyaeowiqvnrdah4t5aeh2exfmzo2mzdfvoin3dy2oizlmxbua
    ONTO m1wcozroq2vtc3uwop4dbepkcohqizpg7damjycc35fujuqiklj3wq
{
  ALTER TYPE client::inventory::Product {
      ALTER LINK stock {
          SET MULTI;
      };
  };
};
