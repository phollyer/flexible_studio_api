package api.mask.loadBitmap
{
	import flash.events.IEventDispatcher;
	import api.mask.Mask;
	
	[Event(name="missingMaskColor" , type="api.events.SWFStudioEvent")]
	[Event(name="missingMaskName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class LoadBitmap extends Mask
	{
		// Optional
		public var tolerance:int = 0;
		
		// Required
		public var maskColor:String = null;
		public var name:String = null;
		public var path:String = null;
		
		public function LoadBitmap(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function loadBitmap( maskName:String = null , color:String = null , filePath:String = null ):void
		{
			name = compareStrings( maskName , name );
			maskColor = compareStrings( color , maskColor );
			path = compareStrings( filePath , path ); 
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( maskColor )
					{
						case null:
							missingColor();
							break;
						default:
							switch( path )
							{
								case null:
									missingPath();
									break;
								default:
									ssCore.Mask.loadBitmap( {name:name , maskColor:maskColor , path:path , tolerance:tolerance}
														   ,{callback:actionComplete, errorSTR:"loadBitmapError", code:"27002"} );
							}
					}
			}
		}


	}
}