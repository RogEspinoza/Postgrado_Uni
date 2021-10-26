namespace System.Configuration
{
    internal class ConfigurationManager
    {
        public static object ConnectionStrings { get; internal set; }

        internal class ConnectionStrings
        {
            private string v;

            public ConnectionStrings(string v)
            {
                this.v = v;
            }
        }
    }
}