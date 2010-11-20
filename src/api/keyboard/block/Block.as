package api.keyboard.block
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Block extends Keyboard
	{
		// Optional
		public var alt:Boolean = false;
		public var ctrl:Boolean = false;
		public var shift:Boolean = false;
		
		// Required
		public var key:String = null;
		
		public function Block(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function block( keyCode:String = null ):void
		{
			key = compareStrings( keyCode , key );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
					var __a:int = convertBooleanToBinary( alt );
					var __c:int = convertBooleanToBinary( ctrl );
					var __s:int = convertBooleanToBinary( shift );
					
					ssCore.Keyboard.block( {key:key , alt:__a , ctrl:__c , shift:__s}
										  ,{callback:actionComplete, errorSTR:"blockError", code:"25000"} ); 
			}
		}
	}
}