class Url < ApplicationRecord
  belongs_to :user
  validates :url,
            presence: true,
            length: { maximum: 300, minimum: 4 },
            format: {
              with: URI::DEFAULT_PARSER.make_regexp,
              message: "URL Inválida",
            }
  validates :name,
            presence: true,
            uniqueness: true,
            length: { maximum: 20, minimum: 3 },
            exclusion: { in: %w([url new users]) },
            format: { with: /\A[a-zA-Z0-9]*\z/,
                      message: "Apelido Inválido" }
end
