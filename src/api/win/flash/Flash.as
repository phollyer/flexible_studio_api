package api.win.flash
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Flash extends Win
	{
		// Optional
		public var invert:Boolean = true;
		
		public function Flash(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function flash():void
		{
			ssCore.Win.flash( {invert:invert}
							 ,{callback:actionComplete, errorSTR:"flashError", code:"6002"} );
		}
	}
}