namespace ChatSample;

public class Startup
{
    
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddMvc();
        services.AddSignalR().AddMessagePackProtocol().AddAzureSignalR();
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        app.UseFileServer();
        app.UseRouting();
        app.UseAuthorization();

        app.UseEndpoints(routes =>
        {
            routes.MapHub<ChatHub>("/chat");
            routes.MapHub<BenchHub>("/signalrbench");
        });
    }
}
