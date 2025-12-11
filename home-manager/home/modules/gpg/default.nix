{
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        # anthony@roussel.dev (created: 2025-12-11)
        source = ./pubkeys/AEB91B2BBEBC627E.asc;
        trust = "ultimate";
      }
      {
        # anthony@roussel.dev (created: 2022-08-05, expired: 2024-08-04)
        source = ./pubkeys/9DC4987B1A55E75E.asc;
        trust = "never";
      }
      {
        # anthony.roussel17@gmail.com (created: 2021-10-16, expired: 2026-10-15)
        source = ./pubkeys/379FF498F4BDCCD9.asc;
        trust = "never";
      }
      {
        # anthony.roussel17@gmail.com (created: 2017-09-26, revoked: 2021-10-16)
        source = ./pubkeys/69661D2F99BE26B6.asc;
        trust = "never";
      }
      {
        # a.roussel53@outlook.com (created: 2014-12-11, revoked: 2021-10-16)
        source = ./pubkeys/8C59046557CBC26E.asc;
        trust = "never";
      }
    ];
  };
}
