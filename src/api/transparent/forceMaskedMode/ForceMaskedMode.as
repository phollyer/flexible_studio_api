package api.transparent.forceMaskedMode
{
	import flash.events.IEventDispatcher;
	import api.transparent.Transparent;
	
	[Bindable]
	public class ForceMaskedMode extends Transparent
	{
		// Required
		public var flag:Boolean = true;
		
		public function ForceMaskedMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function forceMaskedMode():void
		{
			ssCore.Transparent.forceMaskedMode( {flag:flag}
									  		   ,{callback:actionComplete, errorSTR:"forceMaskedModeError", code:"42001"} );
		}
	}
}