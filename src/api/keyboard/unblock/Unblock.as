package api.keyboard.unblock
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Unblock extends Keyboard
	{
		// Optional
		public var alt:Boolean = false;
		public var ctrl:Boolean = false;
		public var shift:Boolean = false;
		
		// Required
		public var key:String = null;
		public function Unblock(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function unblock( keySTR:String = null ):void
		{
			key = compareStrings( keySTR , key );
			var __a:int = convertBooleanToBinary( alt );
			var __c:int = convertBooleanToBinary( ctrl );
			var __s:int = convertBooleanToBinary( shift );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
					ssCore.Keyboard.unblock( {key:key , alt:__a , ctrl:__c , shift:__s}
											,{callback:actionComplete, errorSTR:"unblockError", code:"25009"} );
			}
		}
	}
}