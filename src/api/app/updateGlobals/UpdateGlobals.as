package api.app.updateGlobals
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	public class UpdateGlobals extends App
	{
		public function UpdateGlobals(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function updateGlobals():void
		{
			ssCore.App.updateGlobals( {} , {callback:actionComplete, errorSTR:"updateGlobalsError", code:"8023"} );
		}
	}
}