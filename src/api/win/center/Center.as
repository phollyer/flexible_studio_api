package api.win.center
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Center extends Win
	{
		// Optional
		public var centerOnPrimarydisplay:Boolean = true;
		
		public function Center(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function center():void
		{
			ssCore.Win.center( {centerOnPrimarydisplay:centerOnPrimarydisplay}
							  ,{callback:actionComplete, errorSTR:"centerError", code:"6001"} );
		}
	}
}