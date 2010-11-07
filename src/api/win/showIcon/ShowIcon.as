package api.win.showIcon
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class ShowIcon extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function ShowIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showIcon():void
		{
			ssCore.Win.showIcon( {flag:flag}
								,{callback:actionComplete, errorSTR:"showIconError", code:"6035"} );
		}
	}
}