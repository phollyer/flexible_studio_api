package api.app.updateTransparency
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	public class UpdateTransparency extends App
	{
		public function UpdateTransparency(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function updateTransparency():void
		{
			ssCore.App.updateTransparency( {} , {callback:actionComplete, errorSTR:"updateTransparencyError", code:"8024"} );
		}
	}
}