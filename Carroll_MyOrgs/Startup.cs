using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyOrgs.Startup))]
namespace MyOrgs
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
