﻿using System;
using System.Collections.Generic;

namespace API_DbFirst.Domains
{
    public partial class Produto
    {
        public Produto()
        {
            PedidoItem = new HashSet<PedidoItem>();
        }

        public Guid Id { get; set; }
        public string Nome { get; set; }
        public float Preco { get; set; }

        public virtual ICollection<PedidoItem> PedidoItem { get; set; }
    }
}
