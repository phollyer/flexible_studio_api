package api.app.forceQuit
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	public class ForceQuit extends App
	{
		public function ForceQuit(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function forceQuit():void
		{
			ssCore.App.forceQuit( {} , {callback:actionComplete, errorSTR:"forceQuitError", code:"8011"} );
		}
	}
}