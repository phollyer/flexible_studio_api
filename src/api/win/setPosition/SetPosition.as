package api.win.setPosition
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetPosition extends Win
	{
		// Optional
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPosition():void
		{
			ssCore.Win.setPosition( {x:x , y:y}
								   ,{callback:actionComplete, errorSTR:"setPositionError", code:"6026"} );
		}
	}
}