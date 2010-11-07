package api.transparent.enable
{
	import flash.events.IEventDispatcher;
	import api.transparent.Transparent;
	
	[Bindable]
	public class Enable extends Transparent
	{
		// Required
		public var flag:Boolean = true;
		
		public function Enable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enable():void
		{
			ssCore.Transparent.enable( {flag:flag}
									  ,{callback:actionComplete, errorSTR:"enableError", code:"42000"} );
		}
	}
}