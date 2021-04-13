namespace :dsb do
  desc "Create merchants"
  task create_merchants: :environment do
    Merchant.create([
                      {
                        "name": "Flatley-Rowe",
                        "email": "info@flatley-rowe.com",
                        "cif": "B611111111"
                      },
                      {
                        "name": "Weissnat, Hackett and Purdy",
                        "email": "info@weissnat-hackett-and-purdy.com",
                        "cif": "B611111112"
                      },
                      {
                        "name": "Streich, Klocko and Marvin",
                        "email": "info@streich-klocko-and-marvin.com",
                        "cif": "B611111113"
                      },
                      {
                        "name": "Pfeffer, Wiza and Jacobson",
                        "email": "info@pfeffer-wiza-and-jacobson.com",
                        "cif": "B611111114"
                      },
                      {
                        "name": "Von and Sons",
                        "email": "info@von-and-sons.com",
                        "cif": "B611111115"
                      },
                      {
                        "name": "Oga Inc",
                        "email": "info@oga-inc.com",
                        "cif": "B611111116"
                      },
                      {
                        "name": "Mayer, Kemmer and Schumm",
                        "email": "info@mayer-kemmer-and-schumm.com",
                        "cif": "B611111117"
                      },
                      {
                        "name": "Zulauf-Roberts",
                        "email": "info@zulauf-roberts.com",
                        "cif": "B611111118"
                      },
                      {
                        "name": "Towne-Waelchi",
                        "email": "info@towne-waelchi.com",
                        "cif": "B611111119"
                      },
                      {
                        "name": "Schoen Inc",
                        "email": "info@schoen-inc.com",
                        "cif": "B611111110"
                      },
                      {
                        "name": "Dietrich-Ortiz",
                        "email": "info@dietrich-ortiz.com",
                        "cif": "B611111111"
                      },
                      {
                        "name": "Lubowitz, Hessel and Berge",
                        "email": "info@lubowitz-hessel-and-berge.com",
                        "cif": "B611111112"
                      },
                      {
                        "name": "Streich-Koepp",
                        "email": "info@streich-koepp.com",
                        "cif": "B611111113"
                      },
                      {
                        "name": "Hodkiewicz-Stehr",
                        "email": "info@hodkiewicz-stehr.com",
                        "cif": "B611111114"
                      }
                    ]
    )
  end
end
