

variable "dashboard" {
  type = map(object({
    name        = string
    permissions = string
    pagename    = string
    pie = map(object({
      title  = string
      row    = number
      column = number
      width  = number
      height = number
      query  = string

    }))
    bar = map(object({
      title  = string
      row    = number
      column = number
      width  = number
      height = number
      query  = string

    }))
    variable = map(object({
      default_values       = list(string)
      is_multi_selection   = bool
      title                = string
      value                = any
      name                 = string
      account_id           = number
      query                = string
      replacement_strategy = string
      type                 = string
    }))


  }))
}

