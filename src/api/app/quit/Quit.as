package api.app.quit
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	public class Quit extends App
	{
		public function Quit(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function quit():void
		{
			ssCore.App.quit( {} , {callback:actionComplete, errorSTR:"quitError", code:"8013"} );
		}
	}
}